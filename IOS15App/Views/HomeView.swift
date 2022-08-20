//
//  HomeView.swift
//  IOS15App
//
//  Created by Pat on 2022/08/20.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled:Bool = false
    
    var body: some View {
        ScrollView {
            GeometryReader{ proxy in
             ///Testing values using the coordinate space of the scroll view
//                Text("\(proxy.frame(in: .named("scroll")).minY)")
                Color.clear
                    .preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
            }
            .frame(height: 0)
            FeaturedItem()
            Color.clear
                .frame(height: 1000)
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                }else{
                    hasScrolled = false
                }
            }
        })
        .safeAreaInset(edge: .top, content: {
            ///Creating our own safe area for custom items
            Color.clear
                .frame(height: 70)
        })
        //MARK: - Custom Navbar
        ///overlay gives us a sticky navbar
        .overlay(
            NavigationBar(title: "Featured")
                .opacity(hasScrolled ? 1 : 0)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
