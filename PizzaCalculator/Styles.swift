//
//  Styles.swift
//  PizzaCalculator
//
//  Created by Paulina Dąbrowska on 04/04/2023.
//

import SwiftUI

class Styles {
    
    struct Background : View {
        var body: some View {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color:
                                MyColor.backgroundLight.value,
                              location: 0.15),
                Gradient.Stop(color:
                                MyColor.backgroundDark.value,
                              location: 0.85),
            ]), startPoint: .top, endPoint: .bottom)
        }
    }
    
    struct OuterViewModifier : ViewModifier {
        
        var geometryProxy : GeometryProxy
        var widthMultiplier : CGFloat
        
        func body(content: Content) -> some View {
            content
                .padding([.top, .bottom], 15)
                .padding([.leading, .trailing], 8)
                .background(MyColor.uiElement.value)
                .cornerRadius(10)
                .frame(width: geometryProxy.size.width * widthMultiplier, height: 100)
                .padding([.leading, .trailing], 15)
                .shadow(radius: 5)
        }
    }

    struct InnerViewModifier : ViewModifier {
        
        var isPicker : Bool
        
        func body(content: Content) -> some View {
            content
                .padding([.bottom, .top], isPicker ? 0 :  5)
                .padding([.leading, .trailing], isPicker ? 0 : 15)
                .background(MyColor.uiElementAccent.value)
                .cornerRadius(isPicker ? 7 : 10)
                .padding([.bottom], -5)
                .shadow(radius: 2)
        }
    }

    struct HeadingModifier : ViewModifier {
        
        let fontColor = Color(red: 37/255, green: 70/255, blue: 37/255)
        
        func body(content: Content) -> some View {
            content
                .foregroundColor(MyColor.font.value)
                .font(.headline)
        }
    }
    
    struct ButtonModifier : ViewModifier {
        func body(content: Content) -> some View {
            content
                .modifier(Styles.HeadingModifier())
                .padding([.top , .bottom], 15)
                .padding([.leading, .trailing], 20)
                .background(MyColor.uiElementAccent.value)
                .cornerRadius(5)
            
                .padding(5)
                .background(MyColor.uiElement.value)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
}

enum MyColor {
    case backgroundLight, backgroundDark
    case uiElement, uiElementAccent
    case font
    case pickerSegment
}

extension MyColor {
    var value : Color {
        get {
            switch self {
            case .backgroundLight:
                return Color(hue: 117/360, saturation: 0.4, brightness: 0.9)
            case .backgroundDark:
                return Color(hue: 117/360, saturation: 0.4, brightness: 0.6)
            case .uiElement:
                return Color(hue: 114/360, saturation: 0.6, brightness: 0.7)
            case .uiElementAccent:
                return Color(hue: 117/360, saturation: 0.6, brightness: 0.8)
            case .font:
                return Color(hue: 117/360, saturation: 0.6, brightness: 0.1)
            case .pickerSegment:
                return Color(hue: 115/360, saturation: 0.25, brightness: 0.75)
            }
        }
    }
}
