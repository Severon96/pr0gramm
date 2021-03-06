//
//  URLVideo.swift
//  pr0gramm
//
//  Created by Dominik Mack on 06.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI
import VideoPlayer
import CoreMedia

struct URLVideo: View {
    
    @State private var play: Bool = true
    @State private var time: CMTime = .zero
    @State private var mute: Bool = false
    
    let videoUrl: String
    
    var realVideoUrl: URL {
        get {
            URL(string: "https://vid.pr0gramm.com/\(videoUrl)")!
        }
    }
    
    var body: some View {
        VStack {
            VideoPlayer(url: realVideoUrl, play: $play, time: $time)
                .autoReplay(true)
                .mute(mute)
                .aspectRatio(contentMode: .fit)
                .onDisappear {
                    play = false
                }
        }.navigationBarItems(trailing: HStack {
            Button(action: {
                self.play.toggle()
            }, label: {
                if play {
                    Image(systemName: "play")
                } else {
                    Image(systemName: "pause")
                }
            })
            
            Button(action: {
                self.mute.toggle()
            }, label: {
                if mute {
                    Image(systemName: "speaker.slash")
                } else {
                    Image(systemName: "speaker.wave.3")
                }
            })
        })
    }
}

struct URLVideo_Previews: PreviewProvider {
    static var previews: some View {
        URLVideo(videoUrl: "2018/12/05/6df3a8f2182fcace.mp4")
    }
}
