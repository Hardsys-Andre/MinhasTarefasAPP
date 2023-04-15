//
//  HomeViewModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import Foundation
import FirebaseFirestore
import Firebase

class HomeViewModel {
    
    let userEmail = "user@example.com" // Email do usuário logado, ou algum identificador único do usuário
    
    private func usuarioRecebido(){
        let db = Firestore.firestore()
        
        db.collection("users").document(userEmail).getDocument { document, error in
            if let error = error {
                print("Erro ao obter documento do Firestore: \(error.localizedDescription)")
            } else if let document = document, document.exists {
                if let imageUrl = document.data()?["imageUrl"] as? String {
                    // Carregue a imagem na UIImageView usando a URL obtida do Firestore
                    let url = URL(string: imageUrl)
                    // Faça o download da imagem e atribua-a à sua UIImageView
                }
            } else {
                print("Documento não encontrado no Firestore")
            }
        }
    }
}
