//
//  Settings.swift
//  pr0gramm
//
//  Created by Dominik Mack on 22.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import Foundation
import SchafKit
import SwiftUI

class SettingsManager: ObservableObject {
    
    static var shared = SettingsManager()
    
    @SettingStorage(key: "defaultTab")
    var defaultTab: String = Tab.topPosts.rawValue
    
}
