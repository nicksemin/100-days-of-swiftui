//
//  ColorCyclingRectangleView.swift
//  Drawing
//
//  Created by Nick Semin on 24.03.2022.
//

import SwiftUI

struct ColorCyclingRectangle: View{
    var amount = 0.0
    var steps = 100
    
    var gradientPoint = 1.00
    
    var body: some View{
        ZStack{
            ForEach(0..<steps){ value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(LinearGradient(colors: [color(for: value, brightness: 1),color(for: value, brightness: 0.5)], startPoint: UnitPoint(x: 0+gradientPoint, y: 0+gradientPoint), endPoint: UnitPoint(x: 1 - gradientPoint, y: 1 - gradientPoint)), lineWidth: 2)
            }
        }
        .drawingGroup()//that one modifier enabled Metal API (instead of Core Graphics used initially) and improves performance drastically
    }
    
    func color(for value: Int, brightness: Double) -> Color{
        var targetHue = Double(value)/Double(steps) + amount
        
        if targetHue > 1{
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ColorCyclingRectangleView: View {
    
    @State private var colorCycle = 0.0
    @State private var gradientPoint = 1.0
    
    var body: some View {
        VStack{
             ColorCyclingRectangle(amount: colorCycle, gradientPoint: gradientPoint)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
                .padding([.bottom, .horizontal])
            
            Slider(value: $gradientPoint, in: 0...1)
                .padding(.horizontal)
        }
    }
}

struct ColorCyclingRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCyclingRectangleView()
    }
}
