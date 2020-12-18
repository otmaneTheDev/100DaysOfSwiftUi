//
//  ContentView.swift
//  converter
//
//  Created by El Ati El Adimi, Othmane on 18/12/2020.
//  Copyright © 2020 El Ati El Adimi, Othmane. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let metricUnits = ["meters","kilometer","feet","yards","miles"]
    
    @State private var selectedInput = 0
    @State private var selectedOutput = 0
    @State private var inputValue = ""
    private var calculatedValue : Double {
        let convertedValue = Double(inputValue) ?? 0
        
        switch (selectedInput,selectedOutput) {
        // METERS
        case (0,1):
            return convertedValue * 0.001
        case (0,2):
            return convertedValue * 3.284
        case (0,3):
            return convertedValue * 1.09361
        case (0,4):
            return convertedValue * 0.000621371
        // KILOMETERS
        case (1,0):
            return convertedValue * 1000
        case (1,2):
            return convertedValue * 3280.84
        case (1,3):
            return convertedValue * 1093.61
        case (1,4):
            return convertedValue * 0.621371
        // FEET
        case (2,0):
            return convertedValue * 0.3048
        case (2,1):
            return convertedValue * 0.0003048
        case (2,3):
            return convertedValue * 0.333333
        case (2,4):
            return convertedValue * 0.000189394
        // YARDS
        case (3,0):
            return convertedValue * 0.9144
        case (3,1):
            return convertedValue * 0.0009144
        case (3,2):
            return convertedValue * 3.0
        case (3,4):
            return convertedValue * 0.000568182
        // MILES
        case (4,0):
            return convertedValue * 1609.34
        case (4,1):
            return convertedValue * 1.60934
        case (4,2):
            return convertedValue * 5280.0
        case (4,3):
            return convertedValue * 1760.0
        default:
            return convertedValue
        }
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Introduce input value")) {
                    TextField("Value", text: $inputValue).keyboardType(.decimalPad)
                }
                Section(header: Text("Select input unit")){
                    Picker("Metric unit",selection: $selectedInput){
                        ForEach(0 ..< metricUnits.count) {
                            Text("\(self.metricUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Select output unit")){
                    Picker("Metric unit",selection: $selectedOutput){
                        ForEach(0 ..< metricUnits.count) {
                            Text("\(self.metricUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Result")){
                    Text("Converted value : \(calculatedValue)")
                }

            }
            .navigationBarTitle("Unit converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
