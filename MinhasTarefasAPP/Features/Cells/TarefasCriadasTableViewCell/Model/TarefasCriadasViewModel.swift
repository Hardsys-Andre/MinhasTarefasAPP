//
//  TarefasCriadasModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/24/23.
//

import Firebase
protocol TarefasCriadasViewModelProtocol: AnyObject {
    func dataTask(title: String, dateTask: String, data: [DocumentSnapshot])
    
}

protocol tarefasCriadasCountProtocol: AnyObject {
    func tasksData(data: [DocumentSnapshot])
}


class TarefasCriadasViewModel {
    
    private weak var delegate:TarefasCriadasViewModelProtocol?
    public func delegate(delegate: TarefasCriadasViewModelProtocol?){
        self.delegate = delegate
    }
    
    private weak var delegateCount:tarefasCriadasCountProtocol?
    public func delegateCount(delegateCount: tarefasCriadasCountProtocol?){
        self.delegateCount = delegateCount
    }
    
  
    // Configurar o Firebase e obter uma referência para o Firestore
    let db = Firestore.firestore()
    
    let email = "Tibia@gmail.com" // Email que você deseja filtrar
    var taskCount: [DocumentSnapshot] = []
    var titleTask: String?
    var dateTask: String?
    
    
    public func tarefas(){
        db.collection("tasks").whereField("email", isEqualTo: email)
            .getDocuments() { (querySnapshot, err: Error?) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        self.titleTask = document.data()["title"] as? String
                        self.dateTask = document.data()["dateTask"] as? String
                        self.taskCount = querySnapshot!.documents
                        
                        
                        self.delegateCount?.tasksData(data: self.taskCount)
                        self.delegate?.dataTask(title: self.titleTask ?? "", dateTask: self.dateTask ?? "", data: self.taskCount)
                        
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

    
    /*public func tarefasCriadas(){
        // Faz a consulta no Firestore com o filtro por e-mail
        db.collection("tasks")
            .whereField("email", isEqualTo: email)
            .getDocuments { [self] (querySnapshot, error) in
                if let error = error {
                    print("Erro ao consultar o Firestore: \(error.localizedDescription)")
                    return
                }
                var listaDeDados: [DocumentSnapshot] = []
                
                for doc in querySnapshot!.documents {
                    print(doc)
                    listaDeDados.append(doc)
                }
                if listaDeDados.count > 0 {
                    dataTasks = listaDeDados
                    print(dataTasks)
                    let primeiroDoc = listaDeDados[0]
                    titleTask = primeiroDoc.data()?["title"] as? String
                    dateTask = primeiroDoc.data()?["dateTask"] as? String
                    delegate?.dataTask(title: titleTask ?? "", dateTask: dateTask ?? "")
                    
                    let dataTask: [String: Any] = ["title": titleTask ?? "", "dateTask": dateTask ?? ""]
                    //dataTasks.append(dataTask)
                }else{
                    print("erro ao buscar")
                }
            }
    }*/
}
