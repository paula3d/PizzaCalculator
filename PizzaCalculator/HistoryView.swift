//
//  HistoryView.swift
//  PizzaCalculator
//
//  Created by Paulina Dąbrowska on 13/03/2023.
//

import SwiftUI

struct HistoryView: View {
    
    @EnvironmentObject var pizzas : Pizzas
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Styles.Background()
                    .ignoresSafeArea()
                
                List {
                    ForEach(pizzas.pizzas) { pizza in
                        NavigationLink {
                            ResultsView(pizza: pizza, enteredFromCaululator: false)
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(pizza.pizzaType.rawValue)
                                        .font(.headline)
                                    Text(pizza.createdOn.formatted(.dateTime.day().month().year()))
                                        .font(.footnote)
                                }
                            }
                        }
                        .listRowBackground(Color.green.opacity(0))
                    }
                    .onDelete(perform: deleteEntry)
                }
                .listStyle(.inset)
                .background(Styles.Background())
                .scrollContentBackground(.hidden)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteEntry(at offsets: IndexSet) {
        for offset in offsets {
            pizzas.remove(at: offset)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
