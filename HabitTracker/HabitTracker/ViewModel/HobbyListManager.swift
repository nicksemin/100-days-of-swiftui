//
//  HobbyData.swift
//  HabitTracker
//
//  Created by Nick Semin on 25.03.2022.
//

import Foundation

class HobbyListManager: ObservableObject{
    @Published var hobbys: [Hobby] = []
    
    init() {
        //
    }
    
    func addHobby(title: String, description: String) {
        hobbys.append(Hobby(id: UUID(), title: title, description: description))
    }
}

extension Hobby {
   mutating func increaseAmount() {
        self.amount += 1
    }
}
