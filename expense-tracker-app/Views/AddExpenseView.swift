//
//  AddExpenseView.swift
//  expense-tracker-app
//
//  Created by Toby Brown on 01/04/2023.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State private var amount: String = ""
    @State private var date = Date()
    @State private var category = ""
    private let categories = [
        "🥘 Food",
        "🚃 Transportation",
        "🏡 Home",
        "📅 Subscriptions",
        "📺 Entertainment",
        "📱 Tech",
        "🪴 Miscellaneous"
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("£")
                        TextField("150", text: $amount)
                            .keyboardType(.decimalPad)
                    }
                }
                Section {
                    DatePicker("Date", selection: $date, displayedComponents: [.date])
                }
                Section {
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                        }
                    }
                }
            }
            .navigationTitle("Add Expense")
            .navigationBarItems(leading: NavigationLink(destination: ContentView()) {
                Text("Back")
                    .foregroundColor(Color.gray)
            })
            .navigationBarItems(trailing: Button("Save") {
                addExpense()
            })
        }
    }
    
    private func addExpense() {
        guard let amount = Double(amount) else {
            return
        }
        let expense = Expense(context: viewContext)
        expense.amount = NSDecimalNumber(value: amount)
        expense.date = date
        expense.category = category
        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch let error {
            print("Error adding expense: \(error.localizedDescription)")
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
