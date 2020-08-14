//
//  PostDetailView.swift
//  pr0gramm
//
//  Created by Dominik Mack on 14.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI

struct PostDetailsView: View {
    
    let item: Item
    
    var score: Int {
        get {
            item.up - item.down
        }
    }
    
    var date: String {
        get {
            DateUtils.dateHelperFunction(item.created)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(String(score))
                    .font(.system(size: 30))
                VStack {
                    HStack {
                        Image(systemName: "person")
                        Text(item.user)
                            .font(.system(size: 20))
                    }
                    HStack {
                        Image(systemName: "clock")
                        Text(date)
                    }
                }
            }
        }
        .foregroundColor(.pr0White)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailsView(item: previewItem)
    }
}
