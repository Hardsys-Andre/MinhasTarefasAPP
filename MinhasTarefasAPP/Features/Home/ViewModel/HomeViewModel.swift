//
//  HomeViewModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

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
}
