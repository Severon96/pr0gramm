//
//  VideoPlayerVIew.swift
//  pr0gramm
//
//  Created by Dominik Mack on 13.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation

struct VideoPlayerView: UIViewRepresentable {
    
    var avPlayerLayer: AVPlayerLayer
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<VideoPlayerView>) {
    }
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(playerLayer: avPlayerLayer)
    }
}
