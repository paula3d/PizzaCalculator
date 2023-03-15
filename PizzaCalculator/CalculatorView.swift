//
//  CalculatorView.swift
//  PizzaCalculator
//
//  Created by Paulina Dąbrowska on 13/03/2023.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            
            HStack {
                VStack (alignment: .leading) {
                    Text("Pizza type")
                    Picker("Pizza type", selection: $viewModel.pizzaType) {
                        Text(PizzaType.neapolitan.toString)
                        Text(PizzaType.classica.toString)
                    }
                    .labelsHidden()
                }
                Spacer()
            }
            .padding()
            
            HStack {
                VStack (alignment: .leading) {
                    Text("Balls")
                    TextField("Ball number", value: $viewModel.ballsNumber, format: .number)
                }
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Ball weight")
                    TextField("Ball weight", value: $viewModel.ballWeight, format: .number)
                }
            }
            .padding()
            
            HStack {
                VStack (alignment: .leading) {
                    Text("Hydratation")
                    TextField("Hydratation", value: $viewModel.hydration, format: .number)
                }
                
                VStack (alignment: .leading) {
                    Text("Yeast type")
                    Picker("Yeast type", selection: $viewModel.yeastType) {
                        Text(YeastType.dry.toString)
                        Text(YeastType.fresh.toString)
                    }
                    .labelsHidden()
                }
            }
            .padding()
            
            Button {
                
            } label: {
                Text("Calculate")
            }
            Spacer()
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
