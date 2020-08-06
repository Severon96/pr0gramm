//
//  URLVideo.swift
//  pr0gramm
//
//  Created by Dominik Mack on 06.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI
import AVKit

struct URLVideo: View {
    
    let videoUrl: String
    
    var body: some View {
        
        VideoPlayer(player: RemoteMediaManager.generateVideoPlayer(videoUrl: videoUrl))
        
    }
}

struct URLVideo_Previews: PreviewProvider {
    static var previews: some View {
        URLVideo(videoUrl: "2018/12/05/6df3a8f2182fcace.mp4")
    }
}
