//
//  Styles.swift
//  IOS15App
//
//  Created by Pat on 2022/08/09.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.9), .black.opacity(0.1)], startPoint: .top, endPoint: .bottom))
                    .blendMode(.overlay)
                
            )
            
    }
}
/// Allows us to use the dot notation of the stroke style
extension View {
    func strokeStyle() -> some View{
        modifier(StrokeStyle())
    }
}
