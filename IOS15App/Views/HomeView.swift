//
//  HomeView.swift
//  IOS15App
//
//  Created by Pat on 2022/08/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            FeaturedItem()
            Color.clear
                .frame(height: 1000)
        }
        .safeAreaInset(edge: .top, content: {
            ///Creating our own safe area for custom items 
            Color.clear
                .frame(height: 70)
        })
        //MARK: - Custom Navbar
        ///overlay gives us a sticky navbar
        .overlay(
            NavigationBar(title: "Featured")
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
