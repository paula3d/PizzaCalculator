//
//  Pizza.swift
//  PizzaCalculator
//
//  Created by Paulina Dąbrowska on 13/03/2023.
//

import Foundation

class Pizza {
    
    var pizzaType : PizzaType
    var yeastType : YeastType
    
    var ballsNumber : Int
    var ballWeight : Int
    var hydratation : Int
    
    var flour : Int
    var water : Int
    var salt : Double
    var yeast : Double
    var oil : Double
    
    
    init(pizzaType : PizzaType, yeastType : YeastType, ballsNumber : Int, ballWeight : Int, hydratation : Int) {
        
        self.pizzaType = pizzaType
        self.yeastType = yeastType
        
        self.ballsNumber = ballsNumber
        self.ballWeight = ballWeight
        self.hydratation = hydratation
        
        
        let weight = ballsNumber * ballWeight
        
        flour = weight * ( 100 - hydratation ) / 100
        water = weight - flour
        
        if pizzaType == .neapolitan {
            salt = Double(water) * 50 / 1000
        } else {
            salt = 0.0 //placeholder
        }
        
        oil = 0.0 //placeholder
        yeast = 0.0 //placeholder
        
        water -= Int(salt + oil)
        
    }
}

enum PizzaType {
    case neapolitan, classica
    
    var toString : String {
        switch self {
        case .neapolitan : return "Neapolitan"
        case .classica : return "Classica"
        }
    }
}

enum YeastType {
    case dry, fresh
    
    var toString : String {
        switch self {
        case .dry : return "dry"
        case .fresh : return "fresh"
        }
    }
}
