//
//  UserDataModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 5/1/23.
//

import Foundation


struct UserDataModel: Codable {
    let email: String
    let name: String
    let lastName: String
    let uf: String
    let city: String
    let imageUrl: String
}
