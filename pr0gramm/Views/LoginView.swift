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
    @State var captcha: String = .empty
    
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
                
                TextField("login.captcha.placeholder", text: $captcha)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                
                Button(action: {
                    networkManager.doLogin(user: user, pass: pass, captcha: captcha, token: networkManager.captcha.token)
                    networkManager.fetchCaptcha(getRandomDouble())
                    self.captcha = ""
                }, label: {
                    Text("login.login")
                })
                .disabled(self.user.isEmpty || self.pass.isEmpty || self.captcha.isEmpty || networkManager.captcha.token.isEmpty)
                
                if(networkManager.login.success) {
                    Text("Success \(networkManager.login.ts)")
                } else {
                    Text("No success \(networkManager.login.ts) because of \(networkManager.login.error ?? "no error")")
                }
            }
            
        }.navigationBarTitle("settings.login")
        .onAppear {
            self.networkManager.fetchCaptcha(getRandomDouble())
        }
    }
    
    func getRandomDouble() -> Double {
        return Double.random(in: 0...1)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
