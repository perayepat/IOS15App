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
                profile()
                
                menu()
                
                links()
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

struct profile: View {
    var body: some View {
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
                        .foregroundStyle(Color(hex: "dee2ff"))
                        .font(.system(size: 200))
                        .offset(x: -50, y: -100)
                        .rotationEffect(Angle.degrees(10))
                        
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
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
    }
}

//MARK: - Menu
struct menu: View {
    var body: some View {
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
    }
}
//MARK: - Linka
struct links: View {
    @State var isDeleted = false
    @State var isPinned = false
    var body: some View {
        Section {
            if !isDeleted{
                Link(destination: URL(string: "https://www.apple.com")!) {
                    HStack{
                        Label( "Apple", systemImage: "globe")
                        Spacer()
                        Image(systemName: "link")
                            .imageScale(.small)
                    }
                }
                //MARK: - Swipe Actions
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button {
                        isDeleted = true
                    } label: {
                        Label("Delete",systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
                }
            }
            Link(destination: URL(string: "https://www.youtube.com")!) {
                HStack{
                    Label( "Youtube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .imageScale(.small)
                }
            }
            .swipeActions {
                pinButton
            }
        }
        .accentColor(.black)
    }
    var pinButton: some View {
        Button {isPinned.toggle()} label:{
            Label(isPinned ? "Unpin":"Pin",
                  systemImage:isPinned ? "pin.slash" :"pin")
        }
        .tint(isPinned ? .gray:.yellow)
    }
}




