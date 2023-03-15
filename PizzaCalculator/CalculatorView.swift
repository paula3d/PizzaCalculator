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
                VStack {
                    Text("test")
                    TextField("test", value: $viewModel.ballsNumber, format: .number)
                }
                
                Spacer()
                
                VStack {
                    Text("test")
                    TextField("test", value: $viewModel.ballWeight, format: .number)
                }
            }
            .padding()
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
