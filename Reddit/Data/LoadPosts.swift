//
//  LoadPosts.swift
//  Reddit
//
//  Created by BPS.Dev01 on 7/17/23.
//

import Foundation

class LoadPosts: ObservableObject {
    @Published var postsArray: [Post] = []
    var selfText: String = ""
    
    init() {
        jsonRequest()
    }
    
    func getPosts() -> [Post] {
        return postsArray
    }
    
    func jsonRequest() {
        if let url = URL(string: "https://www.reddit.com/r/androiddev.json") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error{
                    print(error)
                }
                if let response = response as? HTTPURLResponse {
                    print(response.statusCode)
                }
                if let data = data {
//                    let dataString = String(data: data, encoding: .utf8)
//                    print(dataString!)
                    if let decoded = try? JSONDecoder().decode(OutestResponse.self, from: data) {
                        for i in 0..<decoded.data.children.count {
                            self.postsArray.append(Post(title: decoded.data.children[i].data.title, author_fullname: decoded.data.children[i].data.author_fullname, selftext: decoded.data.children[i].data.selftext))
                        }
                        print("Success from network!")
                        return
                    }
                } else {
                    self.postsArray = []
                }
            }.resume()
        } else {
            postsArray = []
        }
    }
}

