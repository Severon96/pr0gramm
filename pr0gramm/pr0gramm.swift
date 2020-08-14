//
//  pr0gramm.swift
//  pr0gramm
//
//  Created by Dominik Mack on 06.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import Foundation
import SwiftUI
import AVKit
import AVFoundation

@main
struct pr0gramm: App {
    
    init() {
        // Audio of the app ignores the mute switch
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
}
