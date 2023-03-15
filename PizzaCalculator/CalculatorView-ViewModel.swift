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
        @Published var hydration : Int
        
        @Published var pizzaType : PizzaType
        @Published var yeastType : YeastType
        
        init() {
            _ballsNumber = Published(initialValue: 4)
            _ballWeight = Published(initialValue: 250)
            _hydration = Published(initialValue: 60)
            
            _pizzaType = Published(initialValue: .neapolitan)
            _yeastType = Published(initialValue: .dry)
        }
    }
}
