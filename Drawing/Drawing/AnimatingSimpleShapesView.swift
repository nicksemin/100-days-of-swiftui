//
//  AnimatingShapesView.swift
//  Drawing
//
//  Created by Nick Semin on 22.03.2022.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: Double
    
    var animatableData: Double{
        get {insetAmount}
        set {insetAmount = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct AnimatingShapesView: View {
    @State private var insetAmout = 50.0
    
    var body: some View {
        Trapezoid(insetAmount: insetAmout)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation{
                insetAmout = Double.random(in: 10...90)
            }
            }
    }
}

struct AnimatingShapesView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingShapesView()
    }
}
