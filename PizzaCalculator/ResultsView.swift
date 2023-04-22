//
//  ResultsView.swift
//  PizzaCalculator
//
//  Created by Paulina Dąbrowska on 21/04/2023.
//

import SwiftUI

struct ResultsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var pizza : Pizza
    var enteredFromCaululator : Bool
    
    @EnvironmentObject var pizzas : Pizzas
    @State private var entrySaved = false
    
    
    var body: some View {
        ZStack {
            Styles.Background()
                .ignoresSafeArea()
            
            VStack {
                List {
                    Section {
                        Text("Pizza type: **\(pizza.pizzaType.rawValue)**")
                            .listRowBackground(Color.green.opacity(0))
                        Text("Number of dough balls: **\(pizza.ballsNumber.formatted())**")
                            .listRowBackground(Color.green.opacity(0))
                        Text("Ball weight: **\(pizza.ballWeight.formatted()) g**")
                            .listRowBackground(Color.green.opacity(0))
                    }
                    Section {
                        Text("Flour: **\(pizza.flour.formatted()) g**")
                            .listRowBackground(Color.green.opacity(0))
                        Text("Water: **\(pizza.water.formatted()) g**")
                            .listRowBackground(Color.green.opacity(0))
                        Text("Oil: **\(pizza.oil.formatted()) g**")
                            .listRowBackground(Color.green.opacity(0))
                        Text("Salt: **\(pizza.salt.formatted()) g**")
                            .listRowBackground(Color.green.opacity(0))
                    }
                    
                    Section {
                        Text("Yeast type: **\(pizza.yeastType.rawValue)**")
                            .listRowBackground(Color.green.opacity(0))
                        Text("Yeast: **\(pizza.yeast.formatted()) g**")
                            .listRowBackground(Color.green.opacity(0))
                    }
                }
                .background(Styles.Background())
                .scrollContentBackground(.hidden)
                .toolbar {
                    if enteredFromCaululator {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                dismiss()
                            } label: {
                                Text("Dismiss")
                            }
                        }
                    }
                }
                if enteredFromCaululator {
                    Button {
                        pizzas.add(pizza)
                        withAnimation(.easeInOut(duration: 1)) {
                            entrySaved = true
                        }
                    } label: {
                        Text("Save")
                            .bold()
                    }
                    Spacer()
                }
            }
            
            if entrySaved {
                VStack {
                    Text("Entry saved")
                        .font(.headline)
                    Text("You can find it in the history")
                        .font(.subheadline)
                }
                .padding()
                .background(MyColor.backgroundLight.value)
                .cornerRadius(10)
            }
        }
        .onTapGesture {
            entrySaved = false
        }
    }

}

struct ResultsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ResultsView(pizza: Pizza(pizzaType: .neapolitan, yeastType: .dry, ballsNumber: 4, ballWeight: 250, hydratation: 60), enteredFromCaululator: true)
        
    }
}
