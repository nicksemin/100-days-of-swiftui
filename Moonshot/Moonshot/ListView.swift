//
//  ListView.swift
//  Moonshot
//
//  Created by Nick Semin on 18.03.2022.
//

import SwiftUI

struct ListView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        
            List{
                ForEach(missions){ mission in
                    NavigationLink{
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        CardView(astronauts: astronauts, mission: mission)
                    }
                }
                .listRowBackground(Color.darkBackround)
            }
            .frame( maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
            .listStyle(GroupedListStyle())
    }
    
}

struct ListView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListView(astronauts: astronauts, missions: missions)
    }
}
