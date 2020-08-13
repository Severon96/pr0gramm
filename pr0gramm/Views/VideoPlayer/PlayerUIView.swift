//
//  PlayerUIView.swift
//  pr0gramm
//
//  Created by Dominik Mack on 13.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation


class PlayerUIView: UIView {
    
    private var playerLayer = AVPlayerLayer()
        
    init(playerLayer: AVPlayerLayer) {
        super.init(frame: .zero)
        
        self.playerLayer = playerLayer
        
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
