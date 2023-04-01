//
//  ContentView.swift
//  expense-tracker-app
//
//  Created by Toby Brown on 29/03/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var amount: String = ""
    var body: some View {
        ZStack {
            VStack {
                Text("You have spent")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                Text("£\(amount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
        .navigationBarItems(trailing: NavigationLink(destination: AddExpenseView()) {
            Text("Add expense")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
