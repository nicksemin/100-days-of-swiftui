//
//  Hobby.swift
//  HabitTracker
//
//  Created by Nick Semin on 25.03.2022.
//

import Foundation

class Hobby: Codable, Identifiable {
    var id: UUID
    
    var title: String
    var description: String
    var amount: Int
    
    init(id: UUID = UUID(), title: String, description: String){
        self.id = id
        self.title = title
        self.description = description
        self.amount = 0
    }
}

