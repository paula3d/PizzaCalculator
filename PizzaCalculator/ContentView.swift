//
//  ContentView.swift
//  PizzaCalculator
//
//  Created by Paulina Dąbrowska on 13/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pizzas = Pizzas()
    
    var body: some View {
        TabView {
            
            CalculatorView()
                .tag(1)
                .tabItem {
                    Label("Calculator", systemImage: "function")
                }
            
            HistoryView()
                .tag(2)
                .tabItem {
                    Label("History", systemImage: "text.book.closed")
                }
        }
        .environmentObject(pizzas)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
