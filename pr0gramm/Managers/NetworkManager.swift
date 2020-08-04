//
//  NetworkManager.swift
//  pr0gramm
//
//  Created by Doctor on 17.07.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var items = [Item]()
    
    func fetchTopPosts() {
        guard let url = URL(string: "https://pr0gramm.com/api/items/get?promoted=1") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return
            }
            
            if let res = response as? HTTPURLResponse, (200...299).contains(res.statusCode) {
                guard let unwrappedData = data else {
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                
                if let results = try? decoder.decode(ItemResult.self, from: unwrappedData) {
                    DispatchQueue.main.async {
                        self.items = results.items
                    }
                } else {
                    print("ERROR: Decoder Error:")
                }
                
            } else {
                print("ERROR: Request failed")
            }
        }
        task.resume()
    }
    
}
