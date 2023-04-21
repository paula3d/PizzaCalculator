//
//  CalculatorView-ViewModel.swift
//  PizzaCalculator
//
//  Created by Paulina Dąbrowska on 13/03/2023.
//

import Foundation

extension CalculatorView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var ballsNumber : Int
        @Published var ballWeight : Int
        @Published var hydration : Int {
            didSet {
                if hydration > 99 {
                    hydration = Int(String(hydration).prefix(2))!
                }
            }
        }
        
        @Published var pizzaType : PizzaType
        @Published var yeastType : YeastType
        
        var pizzas = Pizzas()
        
        init() {
            _ballsNumber = Published(initialValue: 4)
            _ballWeight = Published(initialValue: 250)
            _hydration = Published(initialValue: 60)
            
            _pizzaType = Published(initialValue: .neapolitan)
            _yeastType = Published(initialValue: .dry)
        }
        
        func calculate() {
            let newPizza = Pizza(pizzaType: pizzaType, yeastType: yeastType, ballsNumber: ballsNumber, ballWeight: ballWeight, hydratation: hydration)
            pizzas.add(newPizza)
        }
    }
}
