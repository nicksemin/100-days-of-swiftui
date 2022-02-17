//
//  ContentView.swift
//  BetterRest
//
//  Created by Nick Semin on 09.02.2022.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defualtWakeTime
    @State private var coffeeAmount = 1
    
    static var defualtWakeTime: Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var bedTime: String{
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hour = (components.hour ?? 0) * 3600
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake:  Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount ))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let bedTime = sleepTime.formatted(date: .omitted, time: .shortened )
            
            return bedTime
            
        }catch{
             let bedTime = "Sorry, there was a problem calculating your bedtime"
            return bedTime
        }
    }
    
    
    var body: some View {
        NavigationView{
        Form{
            Section(header:
            Text("When do you want yo wake up?")
                .font(.headline)){
            
            DatePicker("Please enter a time:", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            }
            Section(header:
            Text("Desired amount of sleep")
                    .font(.headline)){
            
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            }
            Section(header:
            Text("Daily coffee intake")
                .font(.headline)){
                Picker(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount.formatted()) cups", selection: $coffeeAmount){
                    ForEach((1...20), id: \.self){
                        Text("\($0.formatted())")
                    }
                }
            }
            
          
            Text("Your bedtime")
                        .font(.headline)
            Text(bedTime)
                .font(.largeTitle)
            
    }
        .navigationTitle("BetterRest")

    }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
