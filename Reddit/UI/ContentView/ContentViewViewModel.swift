//
//  ContentViewViewModel.swift
//  Reddit
//
//  Created by BPS.Dev01 on 7/17/23.
//

import Foundation

extension ContentView {
    
    @MainActor class ViewModel: ObservableObject {
        var loadPosts: LoadPosts = LoadPosts()
        @Published var postsArray: [Post]
        @Published var alertTitle = ""
        @Published var alertMessage = ""
        @Published var showAlert = false
        
        init() {
            postsArray = loadPosts.getPosts()
        }
        
        func buildAlert(title: String, body: String) {
            alertTitle = title
            alertMessage = body
            showAlert = true
        }
        
        func updatePosts() {
            postsArray = loadPosts.getPosts()
        }
    }
}
