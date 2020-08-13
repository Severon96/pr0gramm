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
    private var avPlayerLayer: AVPlayerLayer
    private var avPlayer: AVQueuePlayer
    
    init(videoUrl: String) {
        self.videoUrl = videoUrl
        self.avPlayerLayer = RemoteMediaManager().generateVideoPlayerLayer(videoUrl: videoUrl)
        
        self.avPlayer = self.avPlayerLayer.player! as! AVQueuePlayer
    }
    
    var body: some View {
        VStack {
            VideoPlayerView(avPlayerLayer: self.avPlayerLayer)
            .onAppear {
                self.avPlayer.play()
            }
            .onDisappear {
                self.avPlayer.pause()
            }
            
            PlayerControlsView(avPlayer: self.avPlayer)
        }
    }
}

struct URLVideo_Previews: PreviewProvider {
    static var previews: some View {
        URLVideo(videoUrl: "2018/12/05/6df3a8f2182fcace.mp4")
    }
}
