//
//  Tab.swift
//  IOS15App
//
//  Created by Pat on 2022/08/19.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab:Tab
}

var tabItems = [
    TabItem(text: "Learn Now", icon: "house",tab: .home),
    TabItem(text: "Explore", icon: "magnifyingglass",tab: .explore),
    TabItem(text: "Notifications", icon: "bell",tab: .notifications),
    TabItem(text: "Library", icon: "rectangle.stack",tab: .library)
]

///Great for a predifiened menu easy access and when you have items to
///in this case were using them to attach the screens to the tab items and other selection effects
enum Tab: String{
    case home
    case explore
    case notifications
    case library
}
