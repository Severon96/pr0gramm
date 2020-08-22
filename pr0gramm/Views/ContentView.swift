//
//  ContentView.swift
//  pr0gramm
//
//  Created by Doctor on 17.07.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    enum Tab {
        case newPosts
        case topPosts
        case settings
    }
    
    @ObservedObject var networkManager = NetworkManager()
    @State private var activeTab: Tab = .newPosts
    
    var body: some View {
        TabView(selection: $activeTab) {
            
            PostsOverview(loadNew: true)
                .tabItem {
                    Image(systemName: "plus.message")
                    Text("newPosts")
                }.tag(Tab.newPosts)
            PostsOverview(loadNew: false)
                .tabItem {
                    Image(systemName: "heart.circle.fill")
                    Text("topPosts")
                }.tag(Tab.topPosts)
            Settings()
                .tabItem {
                    Image(systemName: "gear")
                    Text("settings")
                }.tag(Tab.settings)
            
        }.foregroundColor(.pr0Orange)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
