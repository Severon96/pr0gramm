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
            HStack(spacing: 30) {
                HStack {
                    PlusButton(score: score)
                    .font(.system(size: 30))
                    
                    Text(String(score))
                        .font(.system(size: 30))
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "person")
                        Text(item.user)
                    }
                    .font(.system(size: 20))
                    
                    HStack {
                        Image(systemName: "clock")
                        Text(date)
                    }
                }
                Spacer()
            }
        }
        .foregroundColor(.pr0White)
        .padding(
            EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        )
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailsView(item: previewItem)
    }
}
