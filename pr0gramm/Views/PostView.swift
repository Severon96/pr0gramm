//
//  DetailView.swift
//  pr0gramm
//
//  Created by Dominik Mack on 05.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI
import AVKit

struct PostView: View {
    
    let item: Item
    
    var body: some View {
        ScrollView {
            VStack {
                
                if self.item.image.hasSuffix(".mp4") {
                    URLVideo(videoUrl: self.item.image)
                } else {
                    URLImage(imageUrl: "https://img.pr0gramm.com/\(self.item.image)")
                        .aspectRatio(contentMode: .fit)
                }
                
                PostDetailsView(item: item)
            }
        }.navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(item: previewItem)
    }
}

let previewItem = Item(id: 1, promoted: 1, userId: 12345, up: 256, down: 128, created: Date(), image: "2007/01/motivation.jpg", thumb: "2007/01/motivation.jpg", width: 1080, height: 720, user: "Severon")
