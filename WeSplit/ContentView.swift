//
//  ContentView.swift
//  WeSplit
//
//  Created by Александр Полочанин on 23.10.23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var isFocused: Bool
    
    let tipPercentages = [ 10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipAmount = checkAmount / 100 * tipSelection
        let totalAmount = tipAmount + checkAmount
        let amountPerPeople = totalAmount / peopleCount
        
        return amountPerPeople
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Ammount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "BYN"))
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    Picker("Number of peoples", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) peoples")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                
                Section("What tip would you like?") {
                    Picker("", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "BYN"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if isFocused {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
