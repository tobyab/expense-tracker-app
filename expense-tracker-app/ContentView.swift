//
//  ContentView.swift
//  expense-tracker-app
//
//  Created by Toby Brown on 29/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    RowView()
                    RowView()
                    RowView()
                } header: {
                    Text("Wednesday 29 March")
                }
                Section {
                    RowView()
                    RowView()
                    RowView()
                } header: {
                    Text("Monday 27 March")
                }
            }
            .navigationTitle("Total: £125")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
