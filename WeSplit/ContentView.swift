//
//  ContentView.swift
//  WeSplit
//
//  Created by Mohit Sengar on 12/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused : Bool
    
    let tipPercentages = [10, 15, 20 ,25, 0]
    
    var totalPerPerson:Double{
        // calculate the per person check amount here
        let peopleCount:Double = Double(numberOfPeople)
        let tipSelection:Double = Double(self.tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal/peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "INR"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Numbers of people", selection: $numberOfPeople) {
                        ForEach(2..<100, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section{
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages,id:\.self) {
                            Text($0,format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much do you want to leave ?")
                }
                
                Section{
                    Text(totalPerPerson,format: .currency(code: Locale.current.currencyCode ?? "INR"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar{
                ToolbarItemGroup(placement:.keyboard){
                    Spacer()
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

// foreach list
struct ForEachView: View {
    let array = ["Mohit","Rohit","Sohan"]
    @State var selectedName = "Mohit"
    
    var body: some View {
        NavigationStack{
            Form{
                Picker("Select any name", selection: $selectedName) {
                    ForEach(array,id:\.self){
                        Text($0)
                    }
                }
            }
        }
    }
}

// state + two way binding for textfield to use name as read and write object we will use $ in the begining and only to read we will only use the variable name only.
struct BindingView:View{
    @State var name = ""
    
    var body: some View{
        Form{
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
    }
}


// simple form view
struct FormView: View{
    var body : some View{
        NavigationStack{
            Form{
                Section{
                    Text("Tap here to see magic")
                }
                
                Section{
                    Button("Tap here to see magic",action:{
                        print("Hello World!")
                    })
                    Button("Tap here to see magic",action:{
                        print("Hello World!")
                    })
                    Button("Tap here to see magic",action:{
                        print("Hello World!")
                    })
                }
                
                
                Section{
                    Button("Tap here to see magic",action:{
                        print("Hello World!")
                    })
                    Button("Tap here to see magic",action:{
                        print("Hello World!")
                    })
                    Button("Tap here to see magic",action:{
                        print("Hello World!")
                    })
                    Button("Tap here to see magic",action:{
                        print("Hello World!")
                    })
                    Button("Tap here to see magic",action:{
                        print("Hello World!")
                    })
                }
            }.navigationTitle("SwiftUI")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
