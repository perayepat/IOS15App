//
//  MatchedView.swift
//  IOS15App
//
//  Created by Pat on 2022/08/21.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show{
                VStack(alignment: .leading, spacing: 12) {
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth:.infinity, alignment: .leading)
                    
                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    
                    Text("Build an IOS app for IOS 15 with custom layouts, animations and ...")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: namespace)
                }
                .padding(20)
                .foregroundColor(.white)
                .background(
                    Color.red
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
                .padding(20)
            }else{
                VStack(alignment: .leading, spacing: 12) {
                    Spacer()
                    Text("Build an IOS app for IOS 15 with custom layouts, animations and ...")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: namespace)
                    
                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    
                    
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth:.infinity, alignment: .leading)
                }
                .foregroundColor(.black)
                .background(
                    Color.blue
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.5, blendDuration: 0)){
                show.toggle()
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
