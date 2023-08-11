//
//  SettingsView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        VStack{
            Text("SettingsView")
            Button("Sign Out"){
                if AuthManager.shared.signOut(){
                    router.path.removeLast(router.path.count)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
