//
//  ContentView.swift
//  Animations
//
//  Created by Nick Semin on 17.02.2022.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier{
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition{
    static var pivot: AnyTransition{
        .modifier(active: CornerRotateModifier(amount: -90 , anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    @State private var showingRed = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
                
            if showingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
            
        }
        .onTapGesture {
            withAnimation{
                showingRed.toggle()
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
