//
//  Settings.swift
//  pr0gramm
//
//  Created by Dominik Mack on 06.08.20.
//  Copyright © 2020 Doctor. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var settingsManager = SettingsManager.shared
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("settings.accountSettings"), content: {
                    NavigationLink(destination: LoginView()) {
                        Text("settings.login")
                    }
                })
                
                Section(header: Text("settings.general"), content: {
                    Picker("settings.general.defaultTab", selection: Binding.init(
                        get: { settingsManager.defaultTab },
                        set: { value in settingsManager.defaultTab = value }
                    )) {
                        ForEach([Tab.newPosts, Tab.topPosts], id: \.rawValue) { tab in
                            Text(LocalizedStringKey(tab.rawValue)).tag(tab.rawValue)
                        }
                    }
                })
            }
            .navigationBarTitle("settings")
        }
    }
    
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
