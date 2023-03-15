//
//  HistoryView.swift
//  PizzaCalculator
//
//  Created by Paulina Dąbrowska on 13/03/2023.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { index in
                    Text("Placeholder \(index)")
                }
            }
            .toolbar(.hidden)
            .navigationTitle("History")
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
