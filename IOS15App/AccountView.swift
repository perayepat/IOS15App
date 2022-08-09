//
//  AccountView.swift
//  IOS15App
//
//  Created by Pat on 2022/08/09.
//

/// 1. `Image Scale` Allows you to change the image scale of an system image
/// 2. Edit sf symbols and  bring more variety
/// 3. `ForegroundStyle` gives you more opostion and allows you to use gradients and more

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            List{
                //MARK: - Account header
                VStack {
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                    //                    .symbolVariant(.circle.fill)
                        .font(.system(size: 32))
                        .symbolRenderingMode(.palette) ///2
                        .foregroundStyle(.blue, .blue.opacity(0.3))
                        .padding()
                        .background(Circle().fill(.ultraThinMaterial))
                        .background(
                            Image(systemName: "hexagon")
                                .symbolVariant(.fill)
                                .foregroundColor(.blue)
                                .font(.system(size: 200))
                                .offset(x: -50, y: -100)
                        )
                    Text("Pat")
                        .font(.title)
                        .fontWeight(.semibold)
                    HStack {
                        Image(systemName: "location")
                            .imageScale(.small) ///1
                        Text("South Africa")
                            .foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth:.infinity)
                .padding()
                //MARK: - Buttons
                Section {
                    NavigationLink{Text("Settings")} label: {
                        Label("Settings", systemImage: "gear")
                    }
                    
                    NavigationLink{Text("Billing")} label: {
                        Label("Billing", systemImage: "creditcard")
                    }
                    NavigationLink {Text("Help")} label: {
                        Label("Help", systemImage: "questionmark")
                    }
                }
                .accentColor(.secondary)
                .listRowSeparator(.hidden)
                //MARK: - Link to safari
                
                Section {
                    Link(destination: URL(string: "https://www.apple.com")!) {
                        HStack{
                            Text( "Website")
                            Spacer()
                            Image(systemName: "link")
                        }
                    }
                }
                .accentColor(.secondary)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
