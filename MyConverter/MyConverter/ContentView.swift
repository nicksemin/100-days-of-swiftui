//
//  ContentView.swift
//  MyConverter
//
//  Created by Nick Semin on 19.01.2022.
//

import SwiftUI

let unitsTemp = ["C°", "K°", "F°"]
let unitsTime = ["Seconds", "Minutes", "Hours"]
let unitsLength = ["mm", "meters", "kilometers"]

let unitsContainer = [unitsLength, unitsTemp, unitsTime]

let lengthCoefficient = [1.00, 1000.00, 1000000.00]
let timeCoefficient = [60.00, 3600.00, 216000.00]

struct ContentView: View {
    
    @State private var value1 = 1.0 //value from a user
    @State private var firstUnits = 0  //state var to set initial units of conversion
    @State private var secondUnits = 0 //state var to get final units
    
    @State var selection: Int = 0
        
    var result: Double{
        
        var coefficientLength: Double //used for length
        
        var intermediate: Double //used for temp
        
        var coefficientTime: Double
        
        
        if (selection == 0){
        switch firstUnits{
        case 0:
            coefficientLength = lengthCoefficient[0]
        case 1:
            coefficientLength = lengthCoefficient[1]
        case 2:
            coefficientLength = lengthCoefficient[2]
        default:
            coefficientLength = 0
        }
        
        switch secondUnits{
        case 0:
            coefficientLength /= lengthCoefficient[0]
        case 1:
            coefficientLength /= lengthCoefficient[1]
        case 2:
            coefficientLength /= lengthCoefficient[2]
        default:
            coefficientLength = 0
        }
        
        let result = value1 * coefficientLength
 
        return result
        }
        
        else if (selection == 1){
            switch firstUnits{
            case 0:
                intermediate = value1
            case 1:
                intermediate = value1 - 273
            case 2:
                intermediate = (value1 - 32) * 0.556
            default:
                return 0;
            }
            
            var result: Double
            
            switch secondUnits{
            case 0:
                result = intermediate
            case 1:
                result = intermediate + 273
            case 2:
                result = (intermediate * 1.8) + 32
            default:
                return 0
            }
            
            return result
        }
        
        else if (selection == 2)
        {
            switch firstUnits{
            case 0:
                coefficientTime = timeCoefficient[0]
            case 1:
                coefficientTime = timeCoefficient[1]
            case 2:
                coefficientTime = timeCoefficient[2]
            default:
                coefficientTime = 0
            }
            
            switch secondUnits{
            case 0:
                coefficientTime /= timeCoefficient[0]
            case 1:
                coefficientTime /= timeCoefficient[1]
            case 2:
                coefficientTime /= timeCoefficient[2]
            default:
                coefficientTime = 0
            }
            
            let result = value1 * coefficientTime
     
            return result
        }
        else{
            return 0
    }
    
    }
    
    var body: some View {
        NavigationView{

            Form{
                Section{
                Picker("What to convert", selection: $selection) {
                    
                    Text("Length").tag(0)
                    Text("Temperature").tag(1)
                    Text("Time").tag(2)
                    
                }.pickerStyle(.segmented)
            }
                Section(header: Text("To convert")){
                    Picker("What to convert", selection: $firstUnits) {
                       
                        ForEach(0..<unitsContainer[selection].count){
                            Text(unitsContainer[selection][$0]).tag($0)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Length to convert", value: $value1, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType( .decimalPad)
                }
                
                Section(header: Text("You will get")){
                    Picker("Placeholder", selection: $secondUnits) {
            
                        ForEach(0..<unitsContainer[selection].count){
                            Text(unitsContainer[selection][$0]).tag($0)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                    Text("\(result, specifier: "%.2f")")
                }
        }
            .navigationTitle(Text("MyConvert"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
