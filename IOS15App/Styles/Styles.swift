//
//  Styles.swift
//  IOS15App
//
//  Created by Pat on 2022/08/09.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    var cornerRadius: CGFloat
    ///This allows us to use the apps setting to alter our features
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(.linearGradient(colors: [
                        .white.opacity(colorScheme == .dark ?  0.6 : 0.3),
                        .black.opacity(colorScheme == .dark ?  0.3 : 0.1)],startPoint: .top, endPoint: .bottom))
                    .blendMode(.overlay)
            )
    }
}
/// Allows us to use the dot notation of the stroke style
extension View {
    func strokeStyle(cornerRaius: CGFloat = 30) -> some View{
        modifier(StrokeStyle(cornerRadius: cornerRaius))
    }
}
