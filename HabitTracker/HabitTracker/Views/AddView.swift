//
//  AddView.swift
//  HabitTracker
//
//  Created by Nick Semin on 25.03.2022.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var hobbyManager: HobbyListManager
    
    @State private var title: String = ""
    @State private var description: String = ""
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack{
        Form{
            Section("New activity") {
            TextField("Title", text: $title)
            TextField("Description", text: $description)
            }
                Button{
                    hobbyManager.addHobby(title: title, description: description)
                    isPresented = false
                } label: {
                    Text("Submit!")
                }
            }
        }
    }
}

//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView(hobbyManager: [Hobby(id: UUID(), title: "Test", description: "Mocked Hobby")], isPresented: .constant(true))
//    }
//}
