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
        ZStack {
            
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color:
                                Color(red: 37/255, green: 142/255, blue: 37/255),
                              location: 0.5),
                Gradient.Stop(color:
                                Color(red: 52/255, green: 203/255, blue: 52/255),
                              location: 0.95),
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            GeometryReader { geo in
                VStack(alignment: .center) {
                    HStack {
                        VStack () {
                            Text("Pizza type")
                                .modifier(HeadingModifier())
                            
                            // TODO: Style the picker
                            Picker("Pizza type", selection: $viewModel.pizzaType) {
                                ForEach(PizzaType.allCases) { pizzaType in
                                    Text(pizzaType.rawValue)
                                }
                            }
                            .pickerStyle(.segmented)
                            .labelsHidden()
                            .modifier(InnerViewModifier(isPicker: true))
                        }
                        .modifier(OuterViewModifier(geometryProxy: geo, widthMultiplier: 0.80))
                    }
                    
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Ball number")
                                .modifier(HeadingModifier())
                            
                            TextField("Ball number", value: $viewModel.ballsNumber, format: .number)
                                .modifier(InnerViewModifier(isPicker: false))
                        }
                        .modifier(OuterViewModifier(geometryProxy: geo, widthMultiplier : 0.40))
                        
                        VStack (alignment: .leading) {
                            Text("Ball weight")
                                .modifier(HeadingModifier())
                            
                            TextField("Ball weight", value: $viewModel.ballWeight, format: .number)
                                .modifier(InnerViewModifier(isPicker: false))
                        }
                        .modifier(OuterViewModifier(geometryProxy: geo, widthMultiplier : 0.40))
                    }
                    
                    HStack {
                        
                        VStack (alignment: .leading) {
                            Text("Hydratation")
                                .modifier(HeadingModifier())
                            
                            TextField("Hydratation", value: $viewModel.ballWeight, format: .number)
                                .modifier(InnerViewModifier(isPicker: false))
                        }
                        .modifier(OuterViewModifier(geometryProxy: geo, widthMultiplier : 0.40))
                        
                        
                        // TODO: Change the appearance, looks kinda ugly
                        VStack(alignment: .leading) {
                            Text("Yeast type")
                                .modifier(HeadingModifier())
                            
                            // TODO: Style the picker
                            Picker("Yeast type", selection: $viewModel.yeastType) {
                                ForEach(YeastType.allCases) { yeastType in
                                    Text(yeastType.rawValue)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .labelsHidden()
                            .modifier(InnerViewModifier(isPicker: true))
                        }
                        .modifier(OuterViewModifier(geometryProxy: geo, widthMultiplier : 0.40))
                    }
                    
                    Button {
                        // TODO: Calculate the values and display results
                        
                    } label: {
                        Text("Calculate")
                            .padding()
                            .modifier(HeadingModifier())
                            .background(Color(red: 51/255, green: 255/255, blue: 51/255))
                            .cornerRadius(30)
                    }
                    
                    
                    Spacer()
                }
            }
        }
    }
}

//struct MyTextFieldView : View {
//
//    var description : String
//    @Binding var value : Int
//
//    let outerColor = Color(red: 0, green: 204/255, blue: 0)
//    let innerColor = Color(red: 51/255, green: 255/255, blue: 51/255)
//    let titleColor = Color(red: 37/255, green: 70/255, blue: 37/255)
//
//
//    var body : some View {
//        VStack (alignment: .leading) {
//            Text(description)
//                .foregroundColor(titleColor)
//                .font(.headline)
//
//            TextField(description, value: $value, format: .number)
//                .padding([.bottom, .top], 5)
//                .padding([.leading], 15)
//                .background(innerColor)
//                .cornerRadius(30)
//                .padding([.bottom], -10)
//                .padding([.leading, .trailing], -10)
//        }
//        .padding()
//        .background(outerColor)
//        .cornerRadius(20)
//    }
//}

//struct MyPickerView : View {
//
//    var description : String
//    @Binding var value : Int
//    var options : [String]
//
//    let outerColor = Color(red: 0, green: 204/255, blue: 0)
//    let innerColor = Color(red: 51/255, green: 255/255, blue: 51/255)
//    let titleColor = Color(red: 37/255, green: 70/255, blue: 37/255)
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(description)
//                .foregroundColor(titleColor)
//                .font(.headline)
//
//            Picker(description, selection: $value) {
//                ForEach(options, id: \.self) { option in
//                    Text(option)
//                }
//            }
//            .labelsHidden()
//            .padding([.bottom, .top], 5)
//            .padding([.leading], 15)
//            .background(innerColor)
//            .cornerRadius(30)
//            .padding([.bottom], -10)
//            .padding([.leading, .trailing], -10)
//        }
//    }
//}

struct OuterViewModifier : ViewModifier {
    
    var geometryProxy : GeometryProxy
    var widthMultiplier : CGFloat
    
    let outerColor = Color(red: 0, green: 204/255, blue: 0)
    
    func body(content: Content) -> some View {
        content
            .padding([.top, .bottom], 15)
            .padding([.leading, .trailing], 8)
            .background(outerColor)
            .cornerRadius(20)
            .frame(width: geometryProxy.size.width * widthMultiplier, height: 100)
            .padding([.leading, .trailing], 15)
    }
}

struct InnerViewModifier : ViewModifier {
    
    var isPicker : Bool
    
    let innerColor = Color(red: 51/255, green: 255/255, blue: 51/255)
    
    func body(content: Content) -> some View {
        content
            .padding([.bottom, .top], 5)
            .padding([.leading], isPicker ? 0 : 15)
            .background(innerColor)
            .cornerRadius(30)
            .padding([.bottom], -10)
            .padding([.leading, .trailing], -3)
    }
}

struct HeadingModifier : ViewModifier {
    
    let fontColor = Color(red: 37/255, green: 70/255, blue: 37/255)
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(fontColor)
            .font(.headline)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
