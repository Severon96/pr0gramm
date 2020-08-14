//
//  URLImage.swift
//  pr0gramm
//
//  Created by Doctor on 17.07.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI

struct URLImage: View {
    
    let imageUrl: String
    
    @ObservedObject var remoteImageManager = RemoteMediaManager()
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        print("Image Data is Empty: \(remoteImageManager.imageData.isEmpty)")
    }

    var body: some View {
        
        HStack {
            if(remoteImageManager.imageData.isEmpty) {
                ProgressView()
            } else {
                Image(uiImage: ((remoteImageManager.imageData.isEmpty) ? UIImage(systemName: "xmark.octagon") : UIImage(data: remoteImageManager.imageData)!)!)
                    .resizable()
            }
        }.onAppear {
            self.remoteImageManager.fetchImage(imageUrl: self.imageUrl)
        }
        
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(imageUrl: "https://img.pr0gramm.com/2007/01/motivation.jpg")
    }
}
