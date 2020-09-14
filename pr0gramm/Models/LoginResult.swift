//
//  LoginResult.swift
//  pr0gramm
//
//  Created by Dominik Mack on 25.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import Foundation

struct LoginResult: Decodable {
    
    var success: Bool
    var identifier: String?
    var ts: Date
    var rt: Int
    var qc: Int
    var error: String?
    var ban: Bool?
    var cache: String?
    
    init() {
        success = false
        identifier = .empty
        ts = Date()
        rt = 0
        qc = 0
        error = nil
        ban = nil
        cache = nil
    }
    
}
