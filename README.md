# 🧮 SplitEase – Bill Splitter (SwiftUI)

SplitEase is a simple and intuitive bill-splitting app built with SwiftUI.
It takes the total amount, number of people, and tip percentage, then calculates:

<table>
  <tr>
    <th style="border: none;"><strong>Current App</strong></th>
    <td style="border: none;"><img src="https://img.shields.io/badge/Xcode-26.1-blue?logo=Xcode&logoColor=white" alt="Firefox-iOS"></td>
    <td style="border: none;"><img src="https://img.shields.io/badge/Swift-5.10-red?logo=Swift&logoColor=white" alt="Firefox-iOS"></td>
    <td style="border: none;"><img src="https://img.shields.io/badge/iOS-26.1+-green?logo=apple&logoColor=white" alt="Firefox-iOS"></td>
  </tr>
</table>

- Total payable amount

- Amount each person must pay

- All values displayed in INR (₹) format

- Perfect for learning SwiftUI forms, state management, and real-time calculations.

## 📸 Demo
### Example:
![demo](https://github.com/user-attachments/assets/0198aa4e-3174-4031-8590-cd68c07df69a)

## ✨ Features

- 💵 Enter Bill Amount (Double supported)

- 👥 Enter Number of People

- 🎁 Select Tip Percentage

- 🧾 Auto Calculation of:

- Tip amount

- Total bill

- Per-person amount

- 🇮🇳 INR Currency Formatting

- 📱 Clean, minimal SwiftUI interface

- 🔄 Real-time updates using @State

- 🛠️ Tech Stack

- Swift 5.9

- SwiftUI

- @State & reactive UI updates

- NumberFormatter for INR currency formatting

# 🚀 How It Works

- User enters the bill amount

- Chooses the number of people to split the bill

- Selects a tip percentage

- App calculates:

- Total = amount + tip

- Per Person = Total / numberOfPeople

- Output shown in ₹ INR format

## 🧮 Core Logic (Code Snippet)
```swift
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
```

## 📦 Installation

- Clone the repository:

git clone https://github.com/your-username/SplitEase.git

- Open the project:

open SplitEase.xcodeproj

- Run on iOS Simulator or device ✔️

## 🧭 Requirements

- macOS with Xcode 15+

- iOS 17+ target

- Swift 5.9+

- No external dependencies

## 📝 Roadmap (optional)

- Dark Mode UI

- Add split summary with share sheet

- Tip slider customization

- Add currency selector (USD, EUR, GBP, AED, etc.)

## 🤝 Contributing

Pull requests are welcome!
For ideas, open an issue or create a PR.

## 📄 License

- This project is MIT Licensed — feel free to use or modify as needed.
