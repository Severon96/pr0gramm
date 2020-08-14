//
//  PostsOverview.swift
//  pr0gramm
//
//  Created by Dominik Mack on 06.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI

struct PostsOverview: View {
    
    let loadNew: Bool
    
    @ObservedObject var networkManager = NetworkManager()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                
                ForEach(networkManager.items) { item in
                
                    NavigationLink(destination: PostView(item: item)) {
                        
                        if item.image.hasSuffix(".mp4") {
                            ItemView(item: item)
                                .overlay(
                                    Image(systemName: "play.fill")
                                        .resizable()
                                        .opacity(0.6)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 50)
                                        .foregroundColor(.pr0White)
                                )
                        } else {
                            ItemView(item: item)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }.onAppear {
            
            if loadNew {
                self.networkManager.fetchNewPosts()
            } else {
                self.networkManager.fetchTopPosts()
            }
        }
    }
}

struct PostsOverview_Previews: PreviewProvider {
    static var previews: some View {
        PostsOverview(loadNew: true)
    }
}
