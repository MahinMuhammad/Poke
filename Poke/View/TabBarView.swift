//
//  TabView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var authManager = AuthManager.shared
    
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
        .navigationDestination(isPresented: Binding<Bool>(get: {return !authManager.isSignedIn}, set: { p in authManager.isSignedIn = p})) {
            SignInView()
        }
        .onAppear {
            // correct the transparency bug for Tab bars
            let tabBarAppearance = UITabBarAppearance()
//            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
