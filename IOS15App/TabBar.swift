//
//  TabBar.swift
//  IOS15App
//
//  Created by Pat on 2022/08/19.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        //aligning to the bottom
        ZStack(alignment: .bottom) {
            ContentView()
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                
            HStack {
                Spacer()
                VStack(spacing:0){
                    Image(systemName: "house")
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 80, height: 29)
                    Text("Learn Now")
                        .font(.caption2)
                }
                Spacer()
                VStack(spacing:0){
                    Image(systemName: "magnifyingglass")
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 80, height: 29)

                    Text("Explore")
                        .font(.caption2)
                }
                Spacer()
            }
            ///Tab Bar background and customisation
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
