//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Nick Semin on 25.03.2022.
//

import SwiftUI

struct ActivityCardView: View {
    
    let hobbyTitle: String
    let hobbyDescription: String
    
    var body: some View {
        ZStack{
            Spacer()
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
            VStack(alignment: .leading){
                
                Spacer()
                Spacer()
                
            Text(hobbyTitle)
                    .font(.title3).bold()
                    .foregroundColor(.white)
                
            Text(hobbyDescription)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
            }
        }
    }
}

struct ActivityCardView_Previews: PreviewProvider {
    static let hobbyTitle = "Swift"
    static let hobbyDescription = "Coding Challenhe"
    
    static var previews: some View {
        ActivityCardView(hobbyTitle: hobbyTitle, hobbyDescription: hobbyDescription)
    }
}
