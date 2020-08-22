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
    @Published var captcha = CaptchaResult()
    
    func fetchTopPosts() {
        guard let url = URL(string: "https://pr0gramm.com/api/items/get?promoted=1") else {
            return
        }
           
        fetchPosts(url)
    }
    
    func fetchNewPosts() {
        guard let url = URL(string: "https://pr0gramm.com/api/items/get?promoted=0") else {
            return
        }
        
        fetchPosts(url)
    }
    
    private func fetchPosts(_ url : URL) {
        
        let data = fetch(url)
        
        if !data.isEmpty {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            
            if let results = try? decoder.decode(ItemResult.self, from: data) {
                DispatchQueue.main.async {
                    self.items = results.items
                }
            } else {
                print("ERROR: Decoder Error:")
            }
        } else {
            print("ERROR: No data received!")
        }
        
    }
    
    func fetchCaptcha(_ bust : Double) {
        guard let url = URL(string: "https://pr0gramm.com/api/user/captcha?bust=\(bust)") else {
            return
        }
        
        let data = fetch(url)
        
        if !data.isEmpty {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            
            if let result = try? decoder.decode(CaptchaResult.self, from: data) {
                DispatchQueue.main.async {
                    print(result)
                    self.captcha = result
                }
            } else {
                print("ERROR: Decoder Error:")
            }
        } else {
            print("ERROR: No data received!")
        }
    }
    
    private func fetch(_ url : URL) -> Data {
        var returnData = Data()
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return
            }
            
            if let res = response as? HTTPURLResponse, (200...299).contains(res.statusCode) {
                guard let unwrappedData = data else {
                    return
                }
                
               returnData = unwrappedData
                
            } else {
                print("ERROR: Request failed")
            }
        }
        task.resume()
        
        return returnData
    }
    
}
