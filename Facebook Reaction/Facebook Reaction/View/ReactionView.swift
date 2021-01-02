//
//  ReactionView.swift
//  Facebook Reaction
//
//  Created by 中筋淳朗 on 2020/11/14.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReactionView: View {
    
    // MARK: - Property
    
    @Binding var post: Post
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (spacing: 15) {
            ForEach(reactions, id: \.self) { item in
                AnimatedImage(name: item)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .scaleEffect(post.reaction == item ? 3 : 1)
                    .offset(y: post.reaction == item ? -50 : 0)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
            } //: ForEach
        } //: HStack
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(
            Color.white
                .clipShape(Capsule())
        )
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
    }
}

// MARK: - Preview

struct ReactionView_Previews: PreviewProvider {
    @State static var post: Post = postData[2]
    
    static var previews: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.gray, Color.black]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            ReactionView(post: $post)
        }
    }
}
