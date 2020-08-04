//
//  ItemResult.swift
//  pr0gramm
//
//  Created by Doctor on 17.07.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import Foundation

struct ItemResult: Decodable {
    
    var atEnd: Bool
    var atStart: Bool
    var items = [Item]()
    
}

struct Item: Decodable, Identifiable {
    
    var id: Int
    var promoted: Int
    var userId: Int
    var up: Int
    var down: Int
    var created: Date
    var image: String
    var thumb: String
    var width: Int
    var height: Int
    var user: String
    
}
