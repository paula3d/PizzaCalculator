//
//  CalculatorView-ViewModel.swift
//  PizzaCalculator
//
//  Created by Paulina Dąbrowska on 13/03/2023.
//

import Foundation

extension CalculatorView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var ballsNumber : Int {
            didSet {
                if ballsNumber > 99 {
                    ballsNumber = Int(String(ballsNumber).prefix(2))!
                }
                pizza = calculate()
            }
        }
        @Published var ballWeight : Int {
            didSet {
                pizza = calculate()
            }
        }
        @Published var hydratation : Int {
            didSet {
                if hydratation > 99 {
                    hydratation = Int(String(hydratation).prefix(2))!
                }
                pizza = calculate()
            }
        }
        
        @Published var pizzaType : PizzaType {
            didSet {
                pizza = calculate()
            }
        }
        @Published var yeastType : YeastType {
            didSet {
                pizza = calculate()
            }
        }
        
        @Published var pizza : Pizza
        
        init() {
            _ballsNumber = Published(initialValue: 4)
            _ballWeight = Published(initialValue: 250)
            _hydratation = Published(initialValue: 60)
            
            _pizzaType = Published(initialValue: .neapolitan)
            _yeastType = Published(initialValue: .dry)
            
            _pizza = Published(initialValue: Pizza(pizzaType: .neapolitan, yeastType: .dry, ballsNumber: 4, ballWeight: 250, hydratation: 60))
        }
        
        func calculate() -> Pizza {
            return Pizza(pizzaType: pizzaType, yeastType: yeastType, ballsNumber: ballsNumber, ballWeight: ballWeight, hydratation: hydratation)
        }
    }
}
