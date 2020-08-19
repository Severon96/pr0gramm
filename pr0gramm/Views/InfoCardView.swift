//
//  InfoCardView.swift
//  pr0gramm
//
//  Created by Dominik Mack on 14.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI

struct InfoCardView: View {
    
    let infoMsg: String
    
    var body: some View {
        Text(infoMsg)
            .padding(10)
            .font(.system(size: 12))
            .cornerRadius(10)
            .background(Color("pr0Grey"))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("pr0White"), lineWidth: 0.5)
            )
    }
}

struct InfoCardView_Previews: PreviewProvider {
    static var previews: some View {
        InfoCardView(infoMsg: "webmNotWorking")
    }
}
