//
//  PlusButton.swift
//  pr0gramm
//
//  Created by Dominik Mack on 14.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI

struct PlusButton: View {
    
    let score: Int
    
    @State private var rotationDegrees = CGFloat(0)
    @State private var postLiked: Bool = false
    
    var body: some View {
        Button(action: {
            print("Post has now \(score + 1) Blussis.")
            
            self.postLiked.toggle()
            
            withAnimation {
                self.rotationDegrees += 360
            }
            
        }, label: {
            Image(systemName: "plus.circle")
                .rotation3DEffect(.degrees(Double(rotationDegrees)), axis: (x: 1, y: 1, z: 1))
                .foregroundColor(postLiked ? .pr0Orange : .pr0White)
        })
    }
}

struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton(score: 10)
    }
}
