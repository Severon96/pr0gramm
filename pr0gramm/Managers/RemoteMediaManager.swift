//
//  RemoteImageManager.swift
//  pr0gramm
//
//  Created by Doctor on 17.07.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import Foundation
import AVKit

class RemoteMediaManager: ObservableObject {
    
    @Published var imageData: Data = Data()
    
    func fetchImage(imageUrl: String) {
        guard let url = URL(string: imageUrl) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return
            }
            
            if let resp = response as? HTTPURLResponse, (200...299).contains(resp.statusCode) {
                guard let unwrappedData: Data = data else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.imageData = unwrappedData
                }
            }
        }.resume()
    }
    
    func generateVideoPlayerLayer(videoUrl urlString: String) -> AVPlayerLayer {
        guard let url = URL(string: "https://vid.pr0gramm.com/\(urlString)") else {
            return AVPlayerLayer()
        }
        
        let playerLayer = AVPlayerLayer()
        
        let avPlayer = AVQueuePlayer(url: url)
        let playerItem = AVPlayerItem(url: url)
        
        _ = AVPlayerLooper(player: avPlayer, templateItem: playerItem)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }

        playerLayer.player = avPlayer
        
        return playerLayer
    }
    
    
    
}
