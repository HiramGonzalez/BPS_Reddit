//
//  PostListView.swift
//  Reddit
//
//  Created by BPS.Dev01 on 7/17/23.
//

import SwiftUI

struct PostListView: View {
    @State var author: String
    @State var title: String
    
    
    var body: some View {
        ZStack {
            Image("rectangle")
                .resizable()
            
            VStack(alignment: .leading) {
                Text("Author: \(author)")
                    .font(.custom("Roboto-Regular", size: 10))
                    .foregroundColor(Color(red: 0.487, green: 0.398, blue: 0.4))
                    .padding(.bottom, 12)
                
                Text(title)
                    .font(.custom("Roboto-Regular", size: 14))
                    .foregroundColor(Color(red: 0.218, green: 0.269, blue: 0.671))
                    .fixedSize(horizontal: false, vertical: true)
                    .underline()
                    .padding(.bottom, 12)
                
                
                HStack {
                    Image("outlinedUiGlobe")
                    Text("View in Browser")
                    Spacer()
                    Text("12 Comments")
                }
                .font(.custom("Roboto-Medium", size: 12))
                .foregroundColor(Color(red: 0.218, green: 0.269, blue: 0.671))
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
        }
        .frame(maxWidth: .infinity, minHeight: 84)
        
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(author: "Hector Flowers", title: "What America looked like if women were in charge")
    }
}
