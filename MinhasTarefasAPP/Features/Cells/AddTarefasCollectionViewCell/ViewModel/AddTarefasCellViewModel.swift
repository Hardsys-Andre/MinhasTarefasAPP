//
//  AddTarefasViewModel.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 4/22/23.
//

import Foundation

struct CategoryData {
    let category: String
}

class AddTarefasCellViewModel {
    
    var categoryData: CategoryData?
    
    init(categoryData: CategoryData){
        self.categoryData = categoryData
        
    }
}
