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
    func deleteTaskFailure()
}

class HomeViewModel {
    
    var dataSource: [TaskModel?] = []
    var dayTaskSelected: [TaskModel?] = []
    var numberOfTasks: [TaskModel?] = []
    var viewDelegate: HomeViewModelViewDelegate?
    
    init(){
    }
    
    func getUser() -> UserDataModel? {
        UserRepository().getUser()
    }
    
    func getTask(row: Int) -> TaskModel? {
        dataSource[row]
    }
    
    func getDayTask(row: Int) -> TaskModel? {
        dayTaskSelected[row]
    }
    
    func getNumberTask(number: Int) -> TaskModel? {
        numberOfTasks[number]
    }
    
    func numberTasksToday(today: Date) -> [TaskModel?] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
      
        let numberTasks = dataSource.filter { task in
            if let taskDate = dateFormatter.date(from: task?.date ?? "") {
                return Calendar.current.isDate(today, inSameDayAs: taskDate)
            } else {
                return false
            }
        }
        numberOfTasks = numberTasks
            return numberTasks
    }
    
    var filter: Bool = false
    
    func taskDay(day: String) -> [TaskModel?] {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        let today = day
        let dateToday = dateFormatter.date(from: today)
      
        let filteredTasks = dataSource.filter { task in
            if let taskDate = dateFormatter.date(from: task?.date ?? "") {
                return Calendar.current.isDate(dateToday ?? Date(), inSameDayAs: taskDate)
            } else {
                return false
            }
        }
            dayTaskSelected = filteredTasks
            return filteredTasks
    }
    
    func fetchTasks() {
        let db = Firestore.firestore()
        
        db.collection("tasks").whereField("email", isEqualTo: getUser()?.email ?? "")
            .addSnapshotListener { [self] querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    self.viewDelegate?.fetchTasksFailure()
                    return
                }
                let taskDataSource = documents.compactMap { document in
                    try? document.data(as: TaskModel.self)
                }
                let arrayOrdenado = taskDataSource.sorted(by: { $0.date < $1.date })
                for taskDataSource in arrayOrdenado {
                    dataSource = arrayOrdenado
                }
                self.viewDelegate?.fetchTasksSuccess()
            }
    }
    
    func deleteOldTasks() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        let today = Date() + 1
        let dateToday = dateFormatter.string(from: today)
        let db = Firestore.firestore()
        
        db.collection("tasks")
            .whereField("date", isLessThan: dateToday)
            .getDocuments() { (querySnapshot, error) in
                
                
                if let error = error {
                    self.viewDelegate?.deleteTaskFailure()
                } else {
                    for document in querySnapshot!.documents {
                        document.reference.delete()
                    }
                }
            }
    }
    
    func deleteTask(title: String) {
        let db = Firestore.firestore()
        
        db.collection("tasks")
            .whereField("title", isEqualTo: title)
            .getDocuments() { (querySnapshot, error) in
                if let error = error {
                    self.viewDelegate?.deleteTaskFailure()
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
}
