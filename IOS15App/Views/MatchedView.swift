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
                CourseItem(namespace: namespace, show: $show)
            }else{
                CourseView(namespace: namespace, show: $show)
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.7, blendDuration: 0)){
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
