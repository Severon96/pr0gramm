//
//  ItemView.swift
//  pr0gramm
//
//  Created by Doctor on 17.07.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI

struct ItemView: View {
    
    let item: Item
    
    var body: some View {
        HStack {
            URLImage(imageUrl: "https://thumb.pr0gramm.com/\(item.thumb)")
            .clipped()
            .aspectRatio(contentMode: .fit)
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: item)
            .previewLayout(.sizeThatFits)
            .environment(\.colorScheme, .dark)
            .environment(\.locale, .init(identifier: "en_US"))
    }
}

let item = Item(id: 1, promoted: 1, userId: 12345, up: 256, down: 128, created: Date(), image: "2007/01/motivation.jpg", thumb: "2007/01/motivation.jpg", width: 1080, height: 720, user: "Severon")
