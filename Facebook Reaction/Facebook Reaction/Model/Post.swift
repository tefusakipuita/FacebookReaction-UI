//
//  Post.swift
//  Facebook Reaction
//
//  Created by 中筋淳朗 on 2020/11/14.
//

import Foundation

struct Post: Identifiable {
    
    var id = UUID().uuidString
    var image: String
    var title: String
    var time: String
    var liked: Bool
    var reaction: String
    var show = false
}
