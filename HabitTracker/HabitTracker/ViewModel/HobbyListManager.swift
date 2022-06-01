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
    
    func incrementAmount(hobby: Hobby) {
        hobby.amount += 1
    }
    
    func addHobby(title: String, description: String) {
        hobbys.append(Hobby(id: UUID(), title: title, description: description))
    }
}

extension Hobby {
    func increaseAmount() {
        self.amount += 1
    }
}
