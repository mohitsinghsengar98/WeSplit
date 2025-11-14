🧮 SplitEase – Bill Splitter (SwiftUI)






SplitEase is a simple and intuitive bill-splitting app built with SwiftUI.
It takes the total amount, number of people, and tip percentage, then calculates:

Total payable amount

Amount each person must pay

All values displayed in INR (₹) format

Perfect for learning SwiftUI forms, state management, and real-time calculations.

📸 Demo

Replace this with your GIF or screen recording

👉 Add your demo GIF here:
Example:
![Demo](demo.gif)

✨ Features

💵 Enter Bill Amount (Double supported)

👥 Enter Number of People

🎁 Select Tip Percentage

🧾 Auto Calculation of:

Tip amount

Total bill

Per-person amount

🇮🇳 INR Currency Formatting

📱 Clean, minimal SwiftUI interface

🔄 Real-time updates using @State

🛠️ Tech Stack

Swift 5.9

SwiftUI

@State & reactive UI updates

NumberFormatter for INR currency formatting

MVVM Lite (if you want, I can add full MVVM folder structure too!)

🚀 How It Works

User enters the bill amount

Chooses the number of people to split the bill

Selects a tip percentage

App calculates:

Total = amount + tip

Per Person = Total / numberOfPeople

Output shown in ₹ INR format

🧮 Core Logic (Code Snippet)
import SwiftUI

struct ContentView: View {

    @State private var amount: Double = 0
    @State private var numberOfPeople: Int = 1
    @State private var tipPercentage: Int = 10

    var formatter: NumberFormatter {
        let f = NumberFormatter()
        f.numberStyle = .currency
        f.locale = Locale(identifier: "en_IN") // INR formatting
        return f
    }

    var totalAmount: Double {
        let tipValue = amount * Double(tipPercentage) / 100
        return amount + tipValue
    }

    var amountPerPerson: Double {
        return totalAmount / Double(max(numberOfPeople, 1))
    }

    var body: some View {
        Form {
            Section(header: Text("Enter Bill Details")) {
                TextField("Amount", value: $amount, format: .number)
                    .keyboardType(.decimalPad)

                Stepper("People: \(numberOfPeople)", value: $numberOfPeople, in: 1...20)

                Picker("Tip", selection: $tipPercentage) {
                    ForEach([0, 5, 10, 15, 20, 25], id: \.self) {
                        Text("\($0)%")
                    }
                }
            }

            Section(header: Text("Results")) {
                Text("Total: \(formatter.string(from: totalAmount as NSNumber) ?? "")")
                Text("Per Person: \(formatter.string(from: amountPerPerson as NSNumber) ?? "")")
            }
        }
        .navigationTitle("SplitEase")
    }
}

📦 Installation

Clone the repository:

git clone https://github.com/your-username/SplitEase.git


Open the project:

open SplitEase.xcodeproj


Run on iOS Simulator or device ✔️

🧭 Requirements

macOS with Xcode 15+

iOS 17+ target

Swift 5.9+

No external dependencies

📝 Roadmap (optional)

Dark Mode UI

Add split summary with share sheet

Tip slider customization

Add currency selector (USD, EUR, GBP, AED, etc.)

🤝 Contributing

Pull requests are welcome!
For ideas, open an issue or create a PR.

📄 License

This project is MIT Licensed — feel free to use or modify as needed.
