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
    
    @ObservedObject var remoteImageManager = RemoteImageManager()
    
    var body: some View {
        Text("test")
//        if !remoteImageManager.imageData.isEmpty {
//            Image(uiImage: UIImage(data: remoteImageManager.imageData)!)
//                .onAppear {
//                    self.remoteImageManager.fetchImage(imageUrl: self.imageUrl)
//            }
//        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(imageUrl: "https://img.pr0gramm.com/2007/01/motivation.jpg")
    }
}