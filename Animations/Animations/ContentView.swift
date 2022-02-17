//
//  ContentView.swift
//  Animations
//
//  Created by Nick Semin on 17.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAount = 1.0
    
    var body: some View {
        Button("Tap Me"){
            animationAount += 0.25
        }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAount)
            .blur(radius: (animationAount - 1)*3)
            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animationAount)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
