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
    @ObservedObject var settingsManager = SettingsManager.shared
    @State private var activeTab: Tab = Tab(rawValue: SettingsManager.shared.defaultTab) ?? .topPosts
    
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
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("settings")
                }.tag(Tab.settings)
            
        }
    }
    
}

enum Tab: String, Codable {
    case newPosts
    case topPosts
    case settings
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
