//
//  ResultsView.swift
//  PizzaCalculator
//
//  Created by Paulina Dąbrowska on 21/04/2023.
//

import SwiftUI

struct ResultsView: View {
    
    var pizza : Pizza
    
    var body: some View {
        ZStack {
            Styles.Background()
                .ignoresSafeArea()
            
            VStack {
                List {
                    Text("Pizza type: \(pizza.pizzaType.rawValue)")
                    // TODO: Add other fields
                    
                        .listRowBackground(MyColor.uiElementAccent.value)
                }
                .background(Styles.Background())
                .scrollContentBackground(.hidden)
            }
        }
    }

}

struct ResultsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ResultsView(pizza: Pizza(pizzaType: .neapolitan, yeastType: .dry, ballsNumber: 4, ballWeight: 250, hydratation: 60))
        
    }
}
