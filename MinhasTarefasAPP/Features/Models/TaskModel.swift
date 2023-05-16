//
//  TaskModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 5/1/23.
//

import Foundation

struct TaskModel: Codable {
    let title: String
    let description: String?
    let priority: String
    let date: String
    let hour: String
    let category: String
}
