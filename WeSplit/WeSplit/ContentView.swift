//
//  ContentView.swift
//  WeSplit
//
//  Created by El Ati El Adimi, Othmane on 18/12/2020.
//  Copyright © 2020 El Ati El Adimi, Othmane. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    private var totalPerPerson : Double {
        // Calculate the total person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(percentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    private var totalAmount : Double {
        let peopleCount = Double(numberOfPeople + 2)
        
        return totalPerPerson * peopleCount
    }
    
    let percentages = [10, 15, 20, 25, 0]
    
    var body : some View {
        NavigationView{
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people",selection: $numberOfPeople ) {
                        ForEach(2 ..< 21){
                            Text("\($0)")
                        }
                    }
                }
                
                Section(header:Text("How much tip do you want to leave ?")){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< percentages.count) {
                            Text("\(self.percentages[$0]) %")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            
                Section(header: Text("Total amount")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
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
