//
//  ContentView.swift
//  pr0gramm
//
//  Created by Doctor on 17.07.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State private var selectedView = "SFW"
    
    var body: some View {
        NavigationView {
            
            TabView {
                PostsOverview(loadNew: true)
                .tabItem {
                    Image(systemName: "plus.message")
                    Text("newPosts")
                }
                PostsOverview(loadNew: false)
                .tabItem {
                    Image(systemName: "heart.circle.fill")
                    Text("topPosts")
                }
                Settings()
                .tabItem {
                    Image(systemName: "gear")
                    Text("settings")
                }
            }
            .navigationBarTitle("pr0gramm.com")
            
        }.foregroundColor(.pr0Orange)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
