//
//  RowView.swift
//  expense-tracker-app
//
//  Created by Toby Brown on 29/03/2023.
//

import SwiftUI

struct RowView: View {
    var body: some View {
        HStack {
            Text("📱")
            Text("Tech")

            Spacer()
                
            Text("£120")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
                
        }
        
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView()
    }
}
