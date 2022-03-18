//
//  ContentView.swift
//  Moonshot
//
//  Created by Nick Semin on 07.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var layout = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    var body: some View {
        NavigationView{
            Group{
                if layout {
                    GridView(astronauts: astronauts, missions: missions)
                    }
                else {
                    ListView(astronauts: astronauts, missions: missions)
                    }
            }
            .navigationTitle("Moonshot")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                            Button("Change layout") {
                                layout.toggle()
                            }
                        }
                }
            .background(.darkBackround)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
