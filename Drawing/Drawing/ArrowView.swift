//
//  ArrowView.swift
//  Drawing
//
//  Created by Nick Semin on 24.03.2022.
//

import SwiftUI

struct Arrow: Shape{
    var width: Double
    var length: Double
    
    var strokeLine: Double
    
    var animatableData: Double{
        get {strokeLine}
        set {strokeLine = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: width*rect.maxY * 4 / 5))
        path.addLine(to: CGPoint(x: length*rect.maxX * 2 / 3, y: width*rect.maxY * 4 / 5))
        path.addLine(to: CGPoint(x: length*rect.maxX * 2 / 3, y: width*rect.maxY))
        path.addLine(to: CGPoint(x: length*rect.maxX, y: width*rect.maxY/2))
        path.addLine(to: CGPoint(x: length*rect.maxX * 2 / 3, y: width*rect.minY))
        path.addLine(to: CGPoint(x: length*rect.maxX * 2 / 3, y: width*rect.maxY / 5))
        path.addLine(to: CGPoint(x: 0, y: width*rect.maxY / 5))
        path.addLine(to: CGPoint(x: 0, y: width*rect.maxY * 4 / 5))
        path.closeSubpath()
       
        return path
    }
    
}

struct ArrowView: View {
    @State private var width = 1.00
    @State private var length = 1.00
    @State private var strokeLine = 10.0
    
    var body: some View {
        VStack{
            
        Spacer()
    
            
        Arrow(width: width, length: length, strokeLine: strokeLine)
                .stroke(Color(hue: strokeLine/10, saturation: 1, brightness: 1), lineWidth: strokeLine)
            .frame(width: 300, height: 300)
            .onTapGesture {
                withAnimation{
                strokeLine = Double.random(in: 1...90)
                }
            }
            
            Spacer()
            
            Text("Width")
            Slider(value: $width, in: 0...1)
                .padding([.horizontal, .bottom])
            
            Text("Length")
            Slider( value: $length, in: 0...1)
                .padding(.horizontal)
        
        }
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}
