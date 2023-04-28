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
    func loginSuccess(userData: UserData)
    func loginFailure(message: String?)
}

class LoginViewModel {
    
    private weak var delegate: LoginViewModelProtocol?
    public func delegate(delegate: LoginViewModelProtocol?){
        self.delegate = delegate
    }
    
    private var auth = Auth.auth()
    public var emailLogado: String?
    
    public func loginUser(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil{
                self.usuarioRecebido(email: email)
                self.emailLogado = email
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
                let userData = UserData(email: email, name: name , imageUrl: imageUrl)
                self.delegate?.loginSuccess(userData: userData)
            }
        }
        
    }
}
