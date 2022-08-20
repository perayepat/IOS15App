//
//  NavigationBar.swift
//  IOS15App
//
//  Created by Pat on 2022/08/20.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 12)
            
            Text(title)
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
        }
            .frame(height: 70)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Featured")
    }
}
