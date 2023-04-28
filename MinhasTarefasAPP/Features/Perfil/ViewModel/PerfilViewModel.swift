//
//  PerfilViewModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/27/23.
//

import Firebase

protocol perfilViewModelProtocol: AnyObject {
    func userSearchData(data: [DocumentSnapshot])
}

class PerfilViewModel {
    
    private weak var delegate:perfilViewModelProtocol?
     public func delegate(delegate: perfilViewModelProtocol?){
     self.delegate = delegate
     }
    
    let db = Firestore.firestore()
    
    var userSearchData: [DocumentSnapshot] = []
    
    public func searchUser(email: String){
        
        db.collection("users").whereField("email", isEqualTo: email)
            .getDocuments() { (querySnapshot, err: Error?) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        
                        self.userSearchData = querySnapshot!.documents
                        
                        self.delegate?.userSearchData(data: self.userSearchData)
                    }
                }
            }
    }
}
