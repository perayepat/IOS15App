//
//  AccountView.swift
//  IOS15App
//
//  Created by Pat on 2022/08/09.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        List(0 ..< 5){ item in
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .listStyle(.sidebar)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
