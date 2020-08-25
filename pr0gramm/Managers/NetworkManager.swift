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
    @Published var login = LoginResult()
    
    /**
     Fetches the top posts from pr0gramm
     */
    func fetchTopPosts() {
        guard let url = URL(string: "https://pr0gramm.com/api/items/get?promoted=1") else {
            return
        }
           
        fetchPosts(url)
    }
    
    /**
     Fetches the new posts from pr0gramm
     */
    func fetchNewPosts() {
        guard let url = URL(string: "https://pr0gramm.com/api/items/get?promoted=0") else {
            return
        }
        
        fetchPosts(url)
    }
    
    /**
     Fetches posts with the given URL
     */
    private func fetchPosts(_ url : URL) {
        
        var populator: ((Data) -> Void)
        
        func populatorFunc(data: Data) -> Void {
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
        
        populator = populatorFunc
        
        fetch(url, populator)
    }
    
    /**
    Fetches a captcha for login
     */
    func fetchCaptcha(_ bust : Double) {
        guard let url = URL(string: "https://pr0gramm.com/api/user/captcha?bust=\(bust)") else {
            return
        }
        
        var populator: ((Data) -> Void)
        
        func populatorFunc(data: Data) -> Void {
            if !data.isEmpty {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                
                if let result = try? decoder.decode(CaptchaResult.self, from: data) {
                    DispatchQueue.main.async {
                        self.captcha = result
                    }
                } else {
                    print("ERROR: Decoder Error:")
                }
            } else {
                print("ERROR: No data received!")
            }
        }
        
        populator = populatorFunc
        
        fetch(url, populator)
        
    }
    
    func doLogin(user: String, pass: String, captcha: String, token: String) {
        guard let url = URL(string: "https://pr0gramm.com/api/user/login") else {
            return
        }
        
        let postString = "name=\(user)&password=\(pass)&captcha=\(captcha)&token=\(token)"
        
        var populator: ((Data) -> Void)
        
        func populatorFunc(data: Data) -> Void {
            if !data.isEmpty {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                
                if let result = try? decoder.decode(LoginResult.self, from: data) {
                    DispatchQueue.main.async {
                        self.login = result
                    }
                } else {
                    print("ERROR: Decoder Error:")
                }
            } else {
                print("ERROR: No data received!")
            }
        }
        
        populator = populatorFunc
        
        doPost(url: url, postString: postString, populator: populator)
        
    }
    
    /**
     Get request that takes a URL and a callback which populates the received JSON data
     */
    private func fetch(_ url : URL, _ populator: @escaping (Data) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return
            }
            
            if let res = response as? HTTPURLResponse, (200...299).contains(res.statusCode) {
                guard let unwrappedData = data else {
                    return
                }

               populator(unwrappedData)
                
            } else {
                print("ERROR: Request failed")
            }
        }
        task.resume()
    }
    
    private func doPost(url: URL, postString: String, populator: @escaping (Data) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                return
            }
            
            if let res = response as? HTTPURLResponse, (200...299).contains(res.statusCode) {
                guard let unwrappedData = data else {
                    return
                }

                populator(unwrappedData)
                
            } else {
                print("ERROR: Request failed")
            }
        }
        
        task.resume()
    }
    
}
