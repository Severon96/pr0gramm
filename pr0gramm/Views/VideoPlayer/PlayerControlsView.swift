//
//  PlayerControls.swift
//  pr0gramm
//
//  Created by Dominik Mack on 13.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI
import AVFoundation

struct PlayerControlsView: View {
    
    let avPlayer: AVPlayer
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PlayerControlsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerControlsView(avPlayer: AVPlayer())
    }
}
