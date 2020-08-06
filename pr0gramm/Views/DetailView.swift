//
//  DetailView.swift
//  pr0gramm
//
//  Created by Dominik Mack on 05.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let item: Item
    
    var body: some View {
        ScrollView {
            VStack {
                URLImage(imageUrl: "https://img.pr0gramm.com/\(self.item.image)")
                    .aspectRatio(contentMode: .fit)
                HStack {
                    Text("uploadedBy \(item.user)")
                }
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: previewItem)
    }
}

let previewItem = Item(id: 1, promoted: 1, userId: 12345, up: 256, down: 128, created: Date(), image: "2007/01/motivation.jpg", thumb: "2007/01/motivation.jpg", width: 1080, height: 720, user: "Severon")
