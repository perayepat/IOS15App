//
//  ContentView.swift
//  IOS15App
//
//  Created by Pat on 2022/08/09.
//
/// 1. The background has a` in:` modifier allowing applying shapes and masks

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading ,spacing: 8) {
            Spacer()
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26, height: 26)
                .cornerRadius(20)
                .padding(9)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle()
                
            Text("SwiftUI for IOS 15")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary,.primary.opacity(0.5)], startPoint: .leading, endPoint: .trailing))
            
            Text("20 Sections - 3 hours".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            
            Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .font(.footnote)
                .frame(maxWidth:.infinity,alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20)
        .padding(.vertical, 20)
        .frame(height: 350)
        ///1
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
//        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
        .strokeStyle()
        .padding(.horizontal, 20)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100 )
        )
        .overlay(
            Image("Illustration 5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 32, y: -80)
        )
    
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}
