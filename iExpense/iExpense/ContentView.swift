//
//  ContentView.swift
//  iExpense
//
//  Created by Nick Semin on 02.03.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showinfAddExpense = false
    @State private var selectedType = 0
    
    var body: some View {
        NavigationView{
            VStack{
            Picker("Type of expenses", selection: $selectedType){
                Text("Personal").tag(0)
                Text("Business").tag(1)
            }.pickerStyle(.segmented)
            
            List{
                ForEach(expenses.items, id: \.id){item in
                    
                    if selectedType == 0 && item.type == "Personal"{
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        if item.amount > 1000 {
                        Text(item.amount, format: .currency(code: "USD"))
                            .foregroundColor(item.amount > 100 ? .red : .green)
                            .bold()
                        }
                        else {
                            Text(item.amount, format: .currency(code: "USD"))
                                .foregroundColor(item.amount > 100 ? .red : .green)
                        }
                    }
                }
                    else if selectedType == 1 && item.type == "Business"{
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        if item.amount > 1000 {
                        Text(item.amount, format: .currency(code: "USD"))
                            .foregroundColor(item.amount > 100 ? .red : .green)
                            .bold()
                        }
                        else {
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                .foregroundColor(item.amount > 100 ? .red : .green)
                        }
                    }
                }
                    else {
                     
                    }
                }
                .onDelete(perform: removeItems)
               
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button{
                    showinfAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showinfAddExpense){
                AddView(expenses: expenses)
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
