//
//  ContentView.swift
//  WeSplit
//
//  Created by Александр Полочанин on 23.10.23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [ 10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Ammount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "BYN"))
                        .keyboardType(.decimalPad)
                    Picker("Number of peoples", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) peoples")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "BYN"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
