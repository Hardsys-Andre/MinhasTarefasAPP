//
//  PerfilViewModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/27/23.
//

import Firebase
import FirebaseFirestoreSwift
import UIKit
import FirebaseStorage

protocol PerfilViewModelProtocol: AnyObject {
    func successUpdate()
    func errorUpdate(message: String)
}

class PerfilViewModel {
    
    private weak var delegate: PerfilViewModelProtocol?
    public func delegate(delegate: PerfilViewModelProtocol?){
        self.delegate = delegate
    }
    
    var userData: UserDataModel? = {
        UserRepository().getUser()
    }()
    
    var imageHasChanged = false
    
    
    init(){
        
    }
    
    func updateUserData(name: String, lastName: String, uf: String, city: String, imageUser: UIImage) {
        guard let email = Auth.auth().currentUser?.email else {
            self.delegate?.errorUpdate(message: "Não foi possível obter o email do usuário logado")
            return
        }
        let db = Firestore.firestore()
        
        let image = imageUser
        let imageData = image.jpegData(compressionQuality: 0.75)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        if imageHasChanged {
            storageRef.child(email).putData(imageData!, metadata: metadata) { (meta, error) in
                storageRef.child(email).downloadURL { url, errorUrl in
                    
                    let userRef = db.collection("users").document(email)
                    db.collection("users").whereField("email", isEqualTo: email).getDocuments { querySnapshot, err in
                        if let err = err {
                            print(err)
                        } else if querySnapshot!.documents.count != 1 {
                            print(querySnapshot?.documents)
                        } else {
                            let document = querySnapshot!.documents.first
                            let userDataModel = [
                                "name": name,
                                "lastName": lastName,
                                "uf": uf,
                                "city": city,
                                "image": url?.absoluteString as Any,
                            ]
                            let model = UserDataModel(email: email, name: name, lastName: lastName, uf: uf, city: city, imageUrl: url?.absoluteString ?? "")
                            
                            document?.reference.updateData(userDataModel)
                            UserRepository().saveUser(model)
                            self.imageHasChanged = false
                            self.delegate?.successUpdate()
                        }
                    }
                }
            }
        }else{
            let userRef = db.collection("users").document(email)
            db.collection("users").whereField("email", isEqualTo: email).getDocuments { querySnapshot, err in
                if let err = err {
                    print(err)
                } else if querySnapshot!.documents.count != 1 {
                    print(querySnapshot?.documents as Any)
                } else {
                    let document = querySnapshot!.documents.first
                    let userDataModel = [
                        "name": name,
                        "lastName": lastName,
                        "uf": uf,
                        "city": city,
                        "image": UserRepository().getUser()?.imageUrl,
                    ]
                    let model = UserDataModel(email: email, name: name, lastName: lastName, uf: uf, city: city, imageUrl: UserRepository().getUser()?.imageUrl ?? "")
                    
                    document?.reference.updateData(userDataModel)
                    UserRepository().saveUser(model)
                    self.delegate?.successUpdate()
                }
            }
        }
        
        
    }
    
}

