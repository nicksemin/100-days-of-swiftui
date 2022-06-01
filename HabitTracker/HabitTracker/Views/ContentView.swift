//
//  ContentView.swift
//  HabitTracker
//
//  Created by Nick Semin on 25.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var hobbyManager: HobbyListManager
    
    @State var addNew: Bool = false
    
    let columns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(hobbyManager.hobbys) {  hobby in
                    NavigationLink {
                        HobbyDetailedView(hobby: hobby)
                    } label: {
                        ActivityCardView(hobbyTitle: hobby.title, hobbyDescription: hobby.description)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .navigationTitle("HobbyTracker")
        .navigationBarItems(trailing: Button(action: {
            addNew = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $addNew){
            AddView(hobbyManager: hobbyManager, isPresented: $addNew)
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let hobby = HobbyListManager()

    static var previews: some View {
        ContentView(hobbyManager: HobbyListManager())
    }
}

