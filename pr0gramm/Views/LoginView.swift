//
//  LoginView.swift
//  pr0gramm
//
//  Created by Dominik Mack on 22.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI
import SchafKit

struct LoginView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    @State var user: String = .empty
    @State var pass: String = .empty
    
    var body: some View {
        VStack {
            Form {
                LabeledView(Text("login.username")) {
                    TextField("login.cha0s", text: $user)
                }
                
                LabeledView(Text("login.password")) {
                    SecureField("login.schmusi", text: $pass)
                }
                
                Image(uiImage: ((networkManager.captcha.captcha.isEmpty) ? UIImage(systemName: "exclamationmark.triangle") : UIImage(data: networkManager.captcha.captcha )!)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Button(action: {
                    print("\(user)")
                    print("\(pass)")
                }, label: {
                    Text("login.login")
                })
                .disabled(self.user.isEmpty || self.pass.isEmpty)
            }
            
        }.navigationBarTitle("settings.login")
        .onAppear {
            let randomDobbler = Double.random(in: 0...1)
            
            self.networkManager.fetchCaptcha(randomDobbler)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
