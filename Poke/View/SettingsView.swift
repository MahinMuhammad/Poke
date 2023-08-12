//
//  SettingsView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
            Text("SettingsView")
            Button("Sign Out"){
                AuthManager.shared.signOut()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
