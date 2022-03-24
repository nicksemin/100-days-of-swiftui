//
//  SpecialEffectsView.swift
//  Drawing
//
//  Created by Nick Semin on 22.03.2022.
//

import SwiftUI

struct SpecialEffectsView: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack{
           
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1-amount)*20)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct SpecialEffectsView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffectsView()
    }
}
