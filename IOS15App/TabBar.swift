//
//  TabBar.swift
//  IOS15App
//
//  Created by Pat on 2022/08/19.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab:Tab = .home
    
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
                Spacer()
                ForEach(tabItems) { item in
                    Button{
                        selectedTab = item.tab
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
                    ///Consistent spacing and aligned tab tiems
                }
            }
            ///Tab Bar background and customisation
            .padding(.horizontal,8)
            .padding(.top,14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
            .strokeStyle(cornerRaius: 34)
            .frame(maxHeight:.infinity,alignment: .bottom) ///allows the fame to take the max height and set it to the bottom
            .ignoresSafeArea()
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
