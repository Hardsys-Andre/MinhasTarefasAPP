//
//  AddTarefasViewModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/21/23.
//

import Foundation
import Firebase
import UIKit

protocol AddTarefasViewModelProtocol: AnyObject {
    func success()
    func failure(message: String?)
}

class AddTarefasViewModel {
    
    private weak var delegate:AddTarefasViewModelProtocol?
    
    public func delegate(delegate: AddTarefasViewModelProtocol?){
        self.delegate = delegate
    }
   
    
    public func addTarefas(email: String, title: String, descriptionTask: String, priority: String, dateTask: String, category: String){
        
        if title == "" || priority == "" || dateTask == "" || category == "" {
            delegate?.failure(message: "Preencha e escolha todas as opções da tarefa")

                
        }else{
            let db = Firestore.firestore()
            
            let taskData: [String: Any] = [
                "email": email,
                "title": title,
                "descripitonTask": descriptionTask,
                "priority": priority,
                "dateTask": dateTask,
                "category": category
            ]
            
            db.collection("tasks").addDocument(data: taskData) { (error) in
                if error != nil {
                    self.delegate?.failure(message: error?.localizedDescription ?? "")
                    
                    
                } else {
                    
                    self.delegate?.success()
                }
            }
        }
    }
    
}
