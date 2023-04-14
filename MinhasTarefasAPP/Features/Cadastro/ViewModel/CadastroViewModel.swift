//
//  CadastroViewModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseAuth
import Firebase
import FirebaseStorage

protocol CadastroViewModelProtocol: AnyObject {
    func sucessCadastro()
    func errorCadastro(errorMessage: String)
}

class CadastroViewModel {
    
    private weak var delegate: CadastroViewModelProtocol?
    public func delegate(delegate: CadastroViewModelProtocol?){
        self.delegate = delegate
    }
    
    private var auth = Auth.auth()
    
    public func cadastroUser(email: String, password: String, nome: String, sobrenome: String, uf: String, cidade: String, imageUser: UIImage){
       
       
        let db = Firestore.firestore()
        
        let image = imageUser
        let imageData = image.jpegData(compressionQuality: 0.75)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"

        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        storageRef.child(email).putData(imageData!, metadata: metadata) { (meta, error) in
            storageRef.child(email).downloadURL { url, errorUrl in
                let userData: [String: Any] = [
                    "nome": nome,
                    "sobrenome": sobrenome,
                    "uf" : uf,
                    "cidade" : cidade,
                    "email": email,
                    "image": url?.absoluteString as Any]
                
                self.auth.createUser(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                            if error.localizedDescription.contains("email") && error.localizedDescription.contains("already in use") {
                                //self.alert?.alert(title: "Atenção", message: "Este email já está cadastrado")
                                return
                            }
                            //self.alert?.alert(title: "Atenção", message: "Falha ao cadastrar")
                            return
                    }else{
                        db.collection("users").addDocument(data: userData) { (error) in
                            if let error = error {
                                print("error")

                                //self.alert?.alert(title: "Atenção", message: "Erro ao salvar usuário: \(error)")
                            } else {
                                /*self.nameTextField.text = ""
                                self.sobrenomeTextField.text = ""
                                self.emailTextField.text = ""
                                self.senhaTextField.text = ""
                                self.imagemUsuario.image = UIImage(named: "galery_cam")*/
                                print("Sucesso no cadastro")
                                
                                //self.alertPop?.alertPop(title: "Parabéns", message: "Cadastro realizado com sucesso")
                            }
                        }
                    }
                }
            }
        }
    }
    
}

