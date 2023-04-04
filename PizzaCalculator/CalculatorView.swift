//
//  CalculatorView.swift
//  PizzaCalculator
//
//  Created by Paulina Dąbrowska on 13/03/2023.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(MyColor.uiElementAccent.value)
    }
    
    var body: some View {
        ZStack {
            
            Styles.Background()
                .ignoresSafeArea()
            
            GeometryReader { geo in
                VStack(alignment: .center) {
                    HStack {
                        VStack () {
                            Text("Pizza type")
                                .modifier(Styles.HeadingModifier())
                            
                            // TODO: Style the picker
                            Picker("Pizza type", selection: $viewModel.pizzaType) {
                                ForEach(PizzaType.allCases) { pizzaType in
                                    Text(pizzaType.rawValue)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .labelsHidden()
                            .modifier(Styles.InnerViewModifier(isPicker: true))
                        }
                        .modifier(Styles.OuterViewModifier(geometryProxy: geo, widthMultiplier: 0.80))
                    }
                    
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Ball number")
                                .modifier(Styles.HeadingModifier())
                            
                            TextField("Ball number", value: $viewModel.ballsNumber, format: .number)
                                .modifier(Styles.InnerViewModifier(isPicker: false))
                        }
                        .modifier(Styles.OuterViewModifier(geometryProxy: geo, widthMultiplier : 0.40))
                        
                        VStack (alignment: .leading) {
                            Text("Ball weight")
                                .modifier(Styles.HeadingModifier())
                            
                            TextField("Ball weight", value: $viewModel.ballWeight, format: .number)
                                .modifier(Styles.InnerViewModifier(isPicker: false))
                        }
                        .modifier(Styles.OuterViewModifier(geometryProxy: geo, widthMultiplier : 0.40))
                    }
                    
                    HStack {
                        
                        VStack (alignment: .leading) {
                            Text("Hydratation")
                                .modifier(Styles.HeadingModifier())
                            
                            TextField("Hydratation", value: $viewModel.ballWeight, format: .number)
                                .modifier(Styles.InnerViewModifier(isPicker: false))
                        }
                        .modifier(Styles.OuterViewModifier(geometryProxy: geo, widthMultiplier : 0.40))
                        
                        
                        // TODO: Change the appearance, looks kinda ugly
                        VStack(alignment: .leading) {
                            Text("Yeast type")
                                .modifier(Styles.HeadingModifier())
                            
                            // TODO: Style the picker
                            Picker("Yeast type", selection: $viewModel.yeastType) {
                                ForEach(YeastType.allCases) { yeastType in
                                    Text(yeastType.rawValue)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .labelsHidden()
                            .modifier(Styles.InnerViewModifier(isPicker: true))
                        }
                        .modifier(Styles.OuterViewModifier(geometryProxy: geo, widthMultiplier : 0.40))
                    }
                    
                    Button {
                        // TODO: Calculate the values and display results
                        
                    } label: {
                        Text("Calculate")
                            .modifier(Styles.ButtonModifier())
                            .padding([.top])
                    }
                    Spacer()
                }
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
