//
//  ContentView.swift
//  Reddit
//
//  Created by BPS.Dev01 on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentView.ViewModel()
    
    var body: some View {
        ZStack {
            Image("orangeBackground")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Reddit")
                    .font(.custom("Roboto-Regular", size: 30))
                    .foregroundColor(.white)
                
                
                ScrollView {
                    VStack {
                        ForEach(viewModel.postsArray, id: \.self) { element in
                            PostListView(author: element.author_fullname, title: element.title)
                                .onTapGesture {
                                    viewModel.buildAlert(title: element.title, body: element.selftext)
                                }
                            Spacer()
                                .frame(height: 16)
                        }
                    }
                }
            }
        }
        .onAppear(perform: viewModel.updatePosts)
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            Button("OK") { }
        } message: {
            Text(viewModel.alertMessage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
