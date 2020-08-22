//
//  Captcha.swift
//  pr0gramm
//
//  Created by Dominik Mack on 22.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import Foundation

struct CaptchaResult: Decodable {
    
    var token: String?
    var captcha: Data?
    var ts: Date?
    var rt: Int?
    
    
}
