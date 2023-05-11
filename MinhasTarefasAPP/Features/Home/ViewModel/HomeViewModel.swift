//
//  HomeViewModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import UIKit

protocol HomeViewModelViewDelegate {
    func fetchTasksSuccess()
    func fetchTasksFailure()
}

class HomeViewModel {
    
    var dataSource: [TaskModel?] = []
    var viewDelegate: HomeViewModelViewDelegate?
    
    init(){
        
    }
    func getUser() -> UserDataModel? {
        UserRepository().getUser()
    }
    
    func getTask(row: Int) -> TaskModel? {
        dataSource[row]
    }
    
    func fetchTasks() {
        let db = Firestore.firestore()
        
        db.collection("tasks").whereField("email", isEqualTo: getUser()?.email ?? "")
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    self.viewDelegate?.fetchTasksFailure()
                    return
                }
                self.dataSource = documents.compactMap { document in
                    try? document.data(as: TaskModel.self)
                }
                self.viewDelegate?.fetchTasksSuccess()
            }
    }
    
    func deleteTask(title: String) {
        let db = Firestore.firestore()
        
        db.collection("tasks")
            .whereField("title", isEqualTo: title)
            .getDocuments() { (querySnapshot, error) in
                if let error = error {
                    print("Error deleting document: \(error)")
                } else {
                    for document in querySnapshot!.documents {
                        document.reference.delete()
                    }
                }
            }
    }
    
    func getTotalDate() -> Int {
        let dateFormatterYear = DateFormatter()
        dateFormatterYear.dateFormat = "yyyy"
        dateFormatterYear.locale = Locale(identifier: "pt_BR")
        let dateYear = Date()
        let dateYearString = dateFormatterYear.string(from: dateYear)
        let year = dateYearString
        
        let dateFormatterMonth = DateFormatter()
        dateFormatterMonth.dateFormat = "MM"
        dateFormatterMonth.locale = Locale(identifier: "pt_BR")
        let dateMonth = Date()
        let dateMonthString = dateFormatterMonth.string(from: dateMonth)
        let month = dateMonthString
        
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.dateFormat = "dd"
        dateFormatterDay.locale = Locale(identifier: "pt_BR")
        let dateDay = Date()
        let dateDayString = dateFormatterDay.string(from: dateDay)
        let day = Int(dateDayString) ?? 0
        
        var dateComponents = DateComponents()
        dateComponents.year = Int(year)
        dateComponents.month = Int(month)

        let calendar = Calendar.current
        let datez = calendar.date(from: dateComponents)
        
        let interval = calendar.dateInterval(of: .month, for: datez!)!

        let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
        let restDays = days - day + 1
        return restDays
    }
    
    func selectedFirstDay(collection: UICollectionView){
        if collection.numberOfItems(inSection: 0) > 0 {
            let indexPath = IndexPath(item: 0, section: 0)
            collection.selectItem(at: indexPath, animated: true, scrollPosition: .left)
        }
    }
}
