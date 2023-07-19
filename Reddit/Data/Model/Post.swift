//
//  Post.swift
//  Reddit
//
//  Created by BPS.Dev01 on 7/17/23.
//

import Foundation

struct Post: Codable, Hashable {
    
    var title: String
    var author_fullname: String
    var selftext: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(author_fullname)
        hasher.combine(title)
    }
}

struct Response: Codable {
    var data: Post
}

struct ResponseChildren: Codable {
    var children: [Response]
}

struct OutestResponse: Codable {
    var data: ResponseChildren
}
