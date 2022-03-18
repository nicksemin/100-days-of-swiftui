//
//  CardView.swift
//  Moonshot
//
//  Created by Nick Semin on 18.03.2022.
//

import SwiftUI

struct CardView: View {
    
    let astronauts: [String: Astronaut]
    let mission: Mission
    
    var body: some View {
        VStack{
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack{
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackgorund)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.lightBackgorund))
        .listRowBackground(Color.lightBackgorund)
    }
}

struct CardView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        CardView(astronauts: astronauts, mission: missions[0])
    }
}
