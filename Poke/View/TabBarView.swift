//
//  TabView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import SwiftUI

struct TabBarView: View {
    
    @StateObject var authManager = AuthManager.shared
    @StateObject var viewModel = TabBarViewModel()

    
    var body: some View {
        
        ZStack {
            Color(K.Colors.canvasColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                switch viewModel.selectedTab{
                case .chatList:
                    ChatListView()
                case .friendList:
                    FriendListView()
                case .settings:
                    SettingsView()
                }
                
                Spacer() // to keep tabbar view at bottom always
                
                RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(Color(K.Colors.tileColor))
                    .frame(height: 100)
                    .padding(.top,-30)
                    .padding(.bottom, -35)
                    .overlay {
                        HStack{
                            Button {
                                viewModel.selectedTab = TabBarViewModel.Tabs.chatList
                            } label: {
                                Image(systemName: "message")
                            }
                            .foregroundColor(viewModel.selectedTab == TabBarViewModel.Tabs.chatList ? .white : .gray)
                            
                            Spacer()
                            
                            Button {
                                viewModel.selectedTab = TabBarViewModel.Tabs.friendList
                            } label: {
                                Image(systemName: "person.2")
                            }
                            .foregroundColor(viewModel.selectedTab == TabBarViewModel.Tabs.friendList ? .white : .gray)
                            
                            Spacer()
                            
                            Button {
                                viewModel.selectedTab = TabBarViewModel.Tabs.settings
                            } label: {
                                Image(systemName: "slider.horizontal.3")
                            }
                            .foregroundColor(viewModel.selectedTab == TabBarViewModel.Tabs.settings ? .white : .gray)
                        }
                        .imageScale(.large)
                        .padding(.leading, 50)
                        .padding(.trailing, 50)
                    }
            }
        }
        .navigationDestination(isPresented: Binding<Bool>(get: {return !authManager.isSignedIn}, set: { p in authManager.isSignedIn = p})) {
            SignInView()
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
