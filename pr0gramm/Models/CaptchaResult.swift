//
//  Captcha.swift
//  pr0gramm
//
//  Created by Dominik Mack on 22.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import Foundation

struct CaptchaResult: Decodable {
    
    private let baseKey = "base64,"
    
    var token: String
    var captcha: Data
    var ts: Date
    var rt: Int
    
    enum CodingKeys: String, CodingKey {
        case token, captcha, ts, rt
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        token = try container.decode(String.self, forKey: .token)
        var captchaString = try container.decode(String.self, forKey: .captcha)
        
        let range: Range<String.Index> = captchaString.range(of: baseKey)!
        let base64Chars: Int = captchaString.count - (captchaString.distance(from: captchaString.startIndex, to: range.lowerBound) + baseKey.count)
        
        captchaString = String(captchaString.suffix(base64Chars))
        captcha = Data(base64Encoded: captchaString) ?? Data()
        
        ts = try container.decode(Date.self, forKey: .ts)
        rt = try container.decode(Int.self, forKey: .rt)
    }
    
    init() {
        //FALLBACK CONSTRUCT
        token = String.empty
        captcha = Data()
        ts = Date()
        rt = 0
    }
}
