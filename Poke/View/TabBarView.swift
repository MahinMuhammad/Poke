//
//  TabView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

/*
 Copyright 2023 Md. Mahinur Rahman
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import SwiftUI

struct TabBarView: View {
    
    @StateObject var authManager = AuthManager.shared
    @StateObject var viewModel = TabBarViewModel()
    @StateObject var profileViewModel = ProfileViewModel()
    
    var body: some View {
        
        ZStack {
            Color(K.Colors.canvasColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                switch viewModel.selectedTab{
                case .chatList:
                    ChatListView()
                case .friendList:
                    ContactListView()
                case .settings:
                    SettingsView(profileViewModel: profileViewModel)
                }
                
                Spacer() // to keep tabbar view at bottom always
                
                RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(Color(K.Colors.fieledColor))
                    .frame(height: 100)
                    .padding(.top,-30)
                    .padding(.bottom, -35)
                    .ignoresSafeArea()
                    .overlay {
                        HStack{
                            Button {
                                viewModel.selectedTab = .chatList
                            } label: {
                                Image(systemName: "bubble.left.and.bubble.right")
                            }
                            .foregroundColor(viewModel.selectedTab == .chatList ? Color(UIColor.label) : .gray)
                            
                            Spacer()
                            
                            Button {
                                viewModel.selectedTab = .friendList
                            } label: {
                                Image(systemName: "person.2")
                            }
                            .foregroundColor(viewModel.selectedTab == .friendList ? Color(UIColor.label) : .gray)
                            
                            Spacer()
                            
                            Button {
                                viewModel.selectedTab = .settings
                            } label: {
                                Image(systemName: "slider.horizontal.3")
                            }
                            .foregroundColor(viewModel.selectedTab == .settings ? Color(UIColor.label) : .gray)
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
        .onAppear{
            viewModel.selectedTab = .chatList
            if authManager.isSignedIn{
                profileViewModel.loadUser()
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
