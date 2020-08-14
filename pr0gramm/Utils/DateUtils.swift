//
//  DateUtils.swift
//  pr0gramm
//
//  Created by Doctor on 04.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import Foundation
import DateHelper

class DateUtils {
    
    static func dateHelperFunction (_ uploaded : Date) -> String {
        let dateString = uploaded.toStringWithRelativeTime()
        
        return dateString
    }
    
}
