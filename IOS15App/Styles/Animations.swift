//
//  Animations.swift
//  IOS15App
//
//  Created by Pat on 2022/08/21.
//


import SwiftUI
//MARK: - Animation presets
extension Animation{
    static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let cloaseCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
}
