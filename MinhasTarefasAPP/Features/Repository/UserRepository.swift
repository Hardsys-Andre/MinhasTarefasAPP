//
//  UserRepository.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 5/3/23.
//

import Foundation

class UserRepository {
    let key = "userData"
    
    func saveUser(_ userData: UserDataModel){
        let data = try? JSONEncoder().encode(userData)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func getUser() -> UserDataModel? {
        guard let data = UserDefaults.standard.object(forKey: key) as? Data else{
            return nil
        }
        return try? JSONDecoder().decode(UserDataModel.self, from: data)
    }
}
