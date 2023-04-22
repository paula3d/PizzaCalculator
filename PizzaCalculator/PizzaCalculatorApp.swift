//
//  PizzaCalculatorApp.swift
//  PizzaCalculator
//
//  Created by Paulina Dąbrowska on 13/03/2023.
//

import SwiftUI

@main
struct PizzaCalculatorApp: App {
    
    @StateObject var pizzas = Pizzas()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pizzas)
        }
    }
}
