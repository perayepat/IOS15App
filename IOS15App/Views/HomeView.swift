//
//  HomeView.swift
//  IOS15App
//
//  Created by Pat on 2022/08/20.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled:Bool = false
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = true
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                
                featured
                
                Text("Courses".uppercased())
                    .font(.footnote.bold())
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                if !show{
                    ForEach(courses) { course in
                        CourseItem(namespace: namespace,course: course ,show: $show)
                            .onTapGesture {
                                withAnimation(.openCard){
                                    show.toggle()
                                    showStatusBar = false
                                    
                                }
                            }
                    }
                }
            }
            .coordinateSpace(name: "scroll")
            
            .safeAreaInset(edge: .top, content: {
                ///Creating our own safe area for custom items
                Color.clear
                    .frame(height: 70)
            })
            //MARK: - Custom Navbar
            ///overlay gives us a sticky navbar
            .overlay(
                NavigationBar(title: "Featured",hasScrolled: $hasScrolled)
            )
            //MARK: - Mathced Geometry full screen
            if show{
                ForEach(courses) { course in
                    CourseView(namespace: namespace, course: course ,show: $show)
                        .zIndex(1)
                        .transition(.asymmetric(insertion: .opacity.animation(.easeInOut(duration: 0.1)), removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))))
                }
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.cloaseCard){
                if newValue {
                    showStatusBar = false
                } else{
                    showStatusBar = true
                }
            }
        }
    }
    
    var scrollDetection: some View{
        //MARK: - Scroll view detection
        GeometryReader{ proxy in
            ///Testing values using the coordinate space of the scroll view
            //                Text("\(proxy.frame(in: .named("scroll")).minY)")
            Color.clear
                .preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                }else{
                    hasScrolled = false
                }
            }
        })
    }
    
    var featured: some View{
        //MARK: - Custom Horizontal Scroll
        TabView {
            ForEach(featuredCourses) { course in
                GeometryReader { proxy in
                    let minX  = proxy.frame(in: .global).minX
                    
                    FeaturedItem(course: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees( minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 40))
                    
                    //MARK: - Parallax effect
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -80)
                                .offset(x: minX / 2)
                                .blur(radius: abs(minX / 80))
                        )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100 )
        )
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
