//
//  ContentView.swift
//  WeSplit
//
//  Created by Sahil Sait on 27/07/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
//    @State private var numberOfPeople = 2
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25,0]
    
    var total: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount/100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
        
    }
    
    var totalPerPerson: Double {
//        let peopleCount = Double(numberOfPeople+2)
        let peopleCount = Double(numberOfPeople) ?? 1
        let grandTotal = total
        let amountPerPerson = grandTotal/peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
//                    Picker(selection: $numberOfPeople, label: Text("Number of people"), content: {
//                        ForEach(2 ..< 100) {num in
//                            Text("\(num) people")
//                        }
//                    })
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker(selection: $tipPercentage, label: Text("Tip percentage"), content: {
                        ForEach(0 ..< tipPercentages.count) {tip in
                            Text("\(tipPercentages[tip])")
                        }
                    })
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Grand total")) {
                    Text("$ \(total, specifier: "%.2f")")
                }
                Section(header: Text("Amount per person")) {
                    Text("$ \(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
