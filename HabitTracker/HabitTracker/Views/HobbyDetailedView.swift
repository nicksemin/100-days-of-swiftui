//
//  ActivityDetailedView.swift
//  HabitTracker
//
//  Created by Nick Semin on 25.03.2022.
//

import SwiftUI

struct HobbyDetailedView: View {

    @State var hobby: Hobby
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .red, .orange]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                
                Spacer()
                
                Text(hobby.title)
                    .font(.title2)
                
                Spacer()
                
                Text(hobby.description)
                    .font(.headline)
                
                Spacer()
                Spacer()
                
                Text("You have practised it \(hobby.amount) times")
                
                Button {
                    hobby.increaseAmount()
                    } label: {
                    Text("Add practise!")
                            .foregroundColor(.white)
                        .font(.headline)
                    }
                        .frame(width: 80, height: 35)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                
                Spacer()
        }
            .frame(width: 250, height: 450)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    }
}
}
