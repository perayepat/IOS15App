//
//  AnimatableFontModifier.swift
//  IOS15App
//
//  Created by Pat on 2022/08/20.
//

import SwiftUI

struct AnimatableFontMofifier: AnimatableModifier{
    var size: Double
    var weight: Font.Weight = .regular
    var design: Font.Design = .default
    
    var animatableData: Double{
        get{size}
        set{size = newValue}
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

//MARK: - Simple to access

extension View{
    func animatableFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View{
        self.modifier(AnimatableFontMofifier(size: size, weight: weight, design: design))
    }
}
