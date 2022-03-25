//
//  ContentView.swift
//  Drawing
//
//  Created by Nick Semin on 19.03.2022.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Challenge")){
            NavigationLink(destination: ArrowView()){
                Text("Challenge: arrow")
            }
                    
            NavigationLink(destination: ColorCyclingRectangleView()){
                Text("Color cycling rectagle w/ gradient")
            }
                }
            
                Section(header: Text("Project 9 samples")){
            NavigationLink(destination: AnimatingComplexShapes()){
                Text("Animation of complex shapes")
            }
                
            NavigationLink(destination: AnimatingShapesView()){
                Text("Animation of simple shapes")
            }
                
            NavigationLink(destination: FlowerView()){
                Text("Flower")
            }
                
            NavigationLink(destination: enabledMetal()){
                Text("drawingGroup w/ Metal")
            }
                    
            NavigationLink(destination: BordersAndFills()){
                Text("Borders and fills")
            }
                
            NavigationLink(destination: SpirographView()) {
                    Text("Spirogrpah")
            }
                
            NavigationLink(destination: SpecialEffectsView()) {
                    Text("Special effects")
            }
                }
        }
            .navigationTitle("Project 9")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
