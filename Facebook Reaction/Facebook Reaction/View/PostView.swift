//
//  PostView.swift
//  Facebook Reaction
//
//  Created by 中筋淳朗 on 2020/11/14.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    
    // MARK: - Property
    
    var screen = UIScreen.main.bounds
    
    @State var post: Post
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            VStack {
                
                // MARK: - Top User Info
                HStack (spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 55, height: 55)
                        Image("profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    } //: ZStack
                    Text("Dragonite")
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                    Text(post.time)
                } //: HStack
                .padding(.bottom, 18)
                .padding(.horizontal, 10)
                
                // MARK: - Post Content
                HStack {
                    Text(post.title)
                        .font(.system(size: 22))
                    Spacer()
                } //: HStack
                .padding(.horizontal, 10)
                Image(post.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: screen.width, height: 300)
                    .clipped()
                
                // MARK: - Bottom Button
                HStack {
                    
                    // MARK: - Like Button
                    HStack {
                        if post.reaction == "" { // デフォルト
                            Image(systemName: "hand.thumbsup")
                                .font(.system(size: 20, weight: .semibold))
                            Text(post.liked ? "Liked" : "Like")
                                .font(.system(size: 20, weight: .semibold))
                        } else { // reactionを選択した場合
                            AnimatedImage(name: post.reaction)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        } //: if
                    } //: HStack
                    .foregroundColor(post.liked ? .yellow : .white)
                    .frame(width: 90, height: 50)
                    
                    // MARK: - Tap
                    .onTapGesture(perform: {
                        post.liked.toggle()
                    })
                    
                    // MARK: - Drag Gesture
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged({ (value) in
                                onChanged(value: value)
                            })
                            .onEnded({ (value) in
                                onEnded(value: value)
                            })
                    )
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Label(
                            title: {
                                Text("Comment")
                                    .font(.system(size: 20, weight: .semibold))
                            },
                            icon: {
                                Image(systemName: "bubble.left")
                                    .font(.system(size: 20, weight: .semibold))
                            }
                        )
                    }) //: Button
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Label(
                            title: {
                                Text("Share")
                                    .font(.system(size: 20, weight: .semibold))
                            },
                            icon: {
                                Image(systemName: "square.and.arrow.up")
                                    .font(.system(size: 20, weight: .semibold))
                            }
                        )
                    }) //: Button
                } //: HStack
                .padding(.horizontal, 20)
                
            } //: VStack
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .background(
                Color.white.opacity(0.2)
                    .cornerRadius(25)
            )
            
            // MARK: - Reaction Bar
            if post.show {
                ReactionView(post: $post)
                    .padding(.leading, 10)
                    .offset(y: -80)
            }
        } //: ZStack
    }
    
    
    // MARK: - Function
    
    func onChanged(value: DragGesture.Value) {
        withAnimation(.easeOut) {
            post.show = true
        }
        
        withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
            let x = value.location.x
            
            if x > 10 && x < 62 {post.reaction = reactions[0]}
            if x > 62 && x < 122 {post.reaction = reactions[1]}
            if x > 122 && x < 182 {post.reaction = reactions[2]}
            if x > 182 && x < 242 {post.reaction = reactions[3]}
            if x > 242 && x < 302 {post.reaction = reactions[4]}
            
            if x < 10 || x > 302 {post.reaction = ""}
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation(Animation.linear.delay(0.3)) {
            post.show = false
        }
    }
}

// MARK: - Preview

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.gray, Color.black]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            PostView(post: postData[0])
        }
    }
}
