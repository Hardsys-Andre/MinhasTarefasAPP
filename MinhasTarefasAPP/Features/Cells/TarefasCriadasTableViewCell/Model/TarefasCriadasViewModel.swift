//
//  TarefasCriadasModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/24/23.
//

import Firebase

protocol tarefasCriadasCountProtocol: AnyObject {
    func tasksData(data: [DocumentSnapshot])
}

class TarefasCriadasViewModel {
    
    private weak var delegateCount:tarefasCriadasCountProtocol?
    public func delegateCount(delegateCount: tarefasCriadasCountProtocol?){
        self.delegateCount = delegateCount
    }
    
    let db = Firestore.firestore()
    
    var taskCount: [DocumentSnapshot] = []
    
    public func tarefas(email: String){
        
        db.collection("tasks").whereField("email", isEqualTo: email)
            .getDocuments() { (querySnapshot, err: Error?) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        
                        self.taskCount = querySnapshot!.documents
                        
                        self.delegateCount?.tasksData(data: self.taskCount)
                    }
                }
        }
    }
    
    func deleteTask(title: String) {
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
