//
//  Pizza.swift
//  PizzaCalculator
//
//  Created by Paulina Dąbrowska on 13/03/2023.
//

import Foundation

class Pizza : Codable, Identifiable {
    
    var id = UUID()
    var pizzaType : PizzaType
    var yeastType : YeastType
    
    var ballsNumber : Double
    var ballWeight : Double
    var hydratation : Double
    
    var flour : Double
    var water : Double
    var salt : Double
    var yeast : Double
    var oil : Double
    
    var createdOn : Date
    
    init(pizzaType : PizzaType, yeastType : YeastType, ballsNumber : Int, ballWeight : Int, hydratation : Int) {
        
        self.pizzaType = pizzaType
        self.yeastType = yeastType
        
        self.ballsNumber = Double(ballsNumber)
        self.ballWeight = Double(ballWeight)
        self.hydratation = Double(hydratation)
        
        
        let weight = self.ballsNumber * self.ballWeight
        
        flour = weight * ( 100 - self.hydratation ) / 100
        water = weight - flour
        
        if pizzaType == .neapolitan {
            salt = flour * 0.015
            oil = flour * 0.015
            yeast = flour * 0.003
        } else {
            salt = 0.0 //placeholder
            oil = 0.0 //placeholder
            yeast = 0.0 //placeholder
        }
        
        water -= salt + oil
        
        createdOn = Date.now
    }
}

enum PizzaType : String, Identifiable, CaseIterable, Codable {
    case neapolitan = "Neapolitan"
    case classica = "Classica"
    
    var id: Self {
        return self
    }
}

enum YeastType: String, Identifiable, CaseIterable, Codable {
    case dry = "Dry"
    case fresh = "Fresh"
    
    var id: Self {
        return self
    }
}

class Pizzas : ObservableObject {
    @Published private(set) var pizzas : [Pizza]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("PizzasData")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            pizzas = try JSONDecoder().decode([Pizza].self, from: data)
        } catch {
            print("Unable to load data.")
            pizzas = []
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(pizzas)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func add(_ pizza : Pizza) {
        if !pizzas.contains(where: { $0.id == pizza.id }) {
            pizzas.insert(pizza, at: 0)
            save()
        }
    }
    
    func remove(at i: Int) {
        pizzas.remove(at: i)
        save()
    }
}
