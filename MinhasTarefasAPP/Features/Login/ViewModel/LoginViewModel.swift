//
//  LoginViewModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol LoginViewModelProtocol: AnyObject {
    func loginSuccess()
    func loginFailure(message: String?)
}

class LoginViewModel {
    
    private weak var delegate: LoginViewModelProtocol?
    public func delegate(delegate: LoginViewModelProtocol?){
        self.delegate = delegate
    }
    
    private var auth = Auth.auth()
    
    public func loginUser(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil{
                self.usuarioRecebido(email: email)
                
            }else{
                self.delegate?.loginFailure(message: error?.localizedDescription)
            }
        }
    }
    
    public func usuarioRecebido(email: String) {
        let db = Firestore.firestore()
        
        db.collection("users").whereField("email", isEqualTo: email as Any).getDocuments() { (querySnapshot, err) in
            if let err = err {
                self.delegate?.loginFailure(message: err.localizedDescription)
            } else {
                guard let data = querySnapshot?.documents.first?.data() else {
                    self.delegate?.loginFailure(message: nil)
                    
                    return
                }
                let imageUrl = data["image"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let lastName = data["lastName"] as? String ?? ""
                let uf = data["uf"] as? String ?? ""
                let city = data["city"] as? String ?? ""
                
                let userData = UserDataModel(email: email, name: name, lastName: lastName, uf: uf, city: city, imageUrl: imageUrl)
                UserRepository().saveUser(userData)
                self.delegate?.loginSuccess()
            }
        }
    }
}
