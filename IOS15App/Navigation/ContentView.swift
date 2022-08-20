//
//  ContentView.swift
//  IOS15App
//
//  Created by Pat on 2022/08/09.
//
/// 1. The background has a` in:` modifier allowing applying shapes and masks

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab:Tab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group{
                switch selectedTab {
                case .home:
                    HomeView()
                case .explore:
                    Text("Explore")
                case .notifications:
                    Text("Notifications")
                case .library:
                    AccountView()
                }
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            TabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ContentView()
//            .preferredColorScheme(.dark)
    }
}
