//
//  TabBar.swift
//  IOS15App
//
//  Created by Pat on 2022/08/19.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab:Tab = .home
    @State var color: Color = Color(hex: "a0c4ff")
    @State var tabItemWidth: CGFloat = .zero
    
    var body: some View {
        //aligning to the bottom
        ZStack(alignment: .bottom) {
            
            Group{
                switch selectedTab {
                case .home:
                    ContentView()
                case .explore:
                    Text("Explore")
                case .notifications:
                    Text("Notifications")
                case .library:
                    AccountView()
                }
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            
            HStack {
                Buttons
            }
            ///Tab Bar background and customisation
            .padding(.horizontal,8)
            .padding(.top,14)
            .frame(height: 88, alignment: .top)
            //MARK: - Background effect
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
            .background(
                background
            )
            //MARK: - Top bar effect
                .overlay(
                    overlay
                )
            .strokeStyle(cornerRaius: 34)
            .frame(maxHeight:.infinity,alignment: .bottom) ///allows the fame to take the max height and set it to the bottom
            .ignoresSafeArea()
           
            
            
        }
    }
    var Buttons: some View{
        ForEach(tabItems) { item in
            Button{
                //MARK: - Tab bar button animation
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)){
                    selectedTab = item.tab
                    color = item.color
                }
            } label: {
                VStack(spacing:0){
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 44, height: 29)
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(selectedTab == item.tab ? .primary: .secondary)
            .blendMode(selectedTab == item.tab ? .overlay : .normal)
            ///Consistent spacing and aligned tab
            //MARK: - Geo reader
            ///added so that the background and the bar can follow the items when selected
            ///We can now detect the size of the element by using an overlay
            .overlay(
                GeometryReader { proxy in
                    //use wistht to
                    //                            Text("\(proxy.size.width)")
                    //MARK: - Using preference keys
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
            )
            .onPreferenceChange(TabPreferenceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
    var background: some View{
        HStack {
            if selectedTab == .library {Spacer()}
            if selectedTab == .explore {Spacer()}
            if selectedTab == .notifications{
                Spacer()
                Spacer()
            }
            //MARK: - Background Circle
            Circle()
                .fill(color)
                .frame(width: tabItemWidth)
            if selectedTab == .home{Spacer()}
            if selectedTab == .explore{
                Spacer()
                Spacer()
            }
            if selectedTab == .notifications{Spacer()}

        }
            .padding(.horizontal,8)
    }
    var overlay: some View{
        HStack {
            if selectedTab == .library {Spacer()}
            if selectedTab == .explore {Spacer()}
            if selectedTab == .notifications{
                Spacer()
                Spacer()
            }
            //MARK: -  Rectangle bar
            Rectangle()
                .fill(color)
                .frame(width: 25, height: 5)
                .cornerRadius(3)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
                
            if selectedTab == .home{Spacer()}
            if selectedTab == .explore{
                Spacer()
                Spacer()
            }
            if selectedTab == .notifications{Spacer()}
        }
            .padding(.horizontal, 8)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .previewInterfaceOrientation(.portrait)
    }
}
