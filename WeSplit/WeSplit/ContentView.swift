//
//  ContentView.swift
//  WeSplit
//
//  Created by Nick Semin on 06.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2

   // let tipPercentages = [10, 15, 20, 25, 0]

    var total: (Double, Double){
        let peopleCount = Double(numberOfPeople+2)
        let tipSelection = Double(tipPercentage)
        let orderAmount = Double(checkAmount)

        let tipValue = orderAmount/100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal/peopleCount
        
        let totals = (amountPerPerson, grandTotal)

        return totals
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: "USD"))
                            .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }

                Section(header: Text("How much tips do you want to leave?")){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<100){
                            Text("\($0)%")
                        }
                    }
                }

                Section(header: Text("Amount per person")) {
                    Text("$\(total.0, specifier: "%.2f")")
                }
                Section(header: Text("Total amount")) {
                    Text("$\(total.1, specifier: "%.2f")")
                }
            }
                    .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
