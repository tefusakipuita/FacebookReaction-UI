//
//  ContentView.swift
//  Facebook Reaction
//
//  Created by 中筋淳朗 on 2020/11/14.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    
    @State var data = postData
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            RadialGradient(gradient: Gradient(colors: [Color.gray, Color.black]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            VStack (spacing: 0) {
                
                // MARK: - Top Bar
                HStack (spacing: 12) {
                    Text("Poke Reaction")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "bubble.left.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                            .frame(width: 50, height: 50)
                            .background(Color.white.opacity(0.3))
                            .clipShape(Circle())
                    })
                    .offset(x: 10, y: -10)
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                            .frame(width: 50, height: 50)
                            .background(Color.white.opacity(0.3))
                            .clipShape(Circle())
                    })
                    .offset(x: 0, y: 38)
                } //: HStack
                .padding(.horizontal, 10)
                .padding(.top, 10)
                .padding(.bottom, 50)
                
                // MARK: - Post
                ScrollView (showsIndicators: false) {
                    VStack (spacing: 18) {
                        ForEach(data) { post in
                            PostView(post: post)
                        }
                    } //: VStack
                    .padding(.horizontal, 10)
                } //: Scroll
                
                Spacer()
            } //: VStack
        } //: ZStack
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
