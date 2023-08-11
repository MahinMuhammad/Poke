//
//  TabView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            ChatListView()
                .tabItem {
                    Image(systemName: "message")
                }
            
            FriendListView()
                .tabItem {
                    Image(systemName: "person.2")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
