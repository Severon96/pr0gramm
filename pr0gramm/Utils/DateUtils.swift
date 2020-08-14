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
    
    static func hoursSincePost(_ created : Date) -> String {
        let diffComponents = Calendar.current.dateComponents([.hour, .minute], from: created, to: Date())
        
        guard let hours = diffComponents.hour else {
            return String(0)
        }
        guard let minutes = diffComponents.minute else {
            return String(0)
        }
        
        var minuteString: String
        
        minuteString = minutes < 10 ? "0\(minutes)" : String(minutes)
        
        return String("\(hours):\(minuteString)")
    }
    
    static func dateHelperFunction (_ uploaded : Date) -> String {
        let dateString = uploaded.toStringWithRelativeTime()
        print(dateString)
        
        return dateString
    }
    
}
