//
//  HomeViewModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/14/23.
//

import Foundation
import FirebaseFirestore
import Firebase
import SDWebImage


struct UserData {
    let email: String
    let name: String
    let imageUrl: String
}


class HomeViewModel {
    
   
    var userData: UserData?
    
    
    init(userData: UserData){
        self.userData = userData
        
        
    }
  
    
   
    
}
