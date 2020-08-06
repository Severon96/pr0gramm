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
    
    let data = (1...1000).map { "Item \($0)" }

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    
                    ForEach(networkManager.items) { item in
                    
                        NavigationLink(destination: DetailView(item: item)) {
                            ItemView(item: item)
                        }
                        
                    }
                    
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("pr0gramm.com")
            
        }.onAppear {
            self.networkManager.fetchTopPosts()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
