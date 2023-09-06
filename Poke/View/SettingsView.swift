//
//  SettingsView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("appTheme") var isDarkModeOn = false
    
    @StateObject var viewModel = SettingsViewModel()
    @StateObject var d = Dummy()
    
    var body: some View {
        VStack{
            HStack {
                Text("Settings")
                    .fontWeight(.bold)
                    .font(.system(size: 32))
                
                Spacer()
                
                Button {
                    viewModel.showProfileView = true
                } label: {
                    AsyncImage(url: d.propic){  image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                            .clipShape(Circle())
                    }placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                            .clipShape(Circle())
                    }
                }
                .sheet(isPresented: $viewModel.showProfileView, content: ProfileView.init)
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top, 40)
            
            ScrollView{
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 110)
                    .foregroundColor(Color(K.Colors.tileColor))
                    .overlay{
                        VStack{
                            Toggle(isOn: $viewModel.isActiveStatusOn) {
                                HStack{
                                    Image(systemName: "person.crop.circle.badge")
                                        .imageScale(.large)
                                    Text("Active Status")
                                        .font(.system(size: 20))
                                }
                            }
                            .tint(Color(K.Colors.primaryColor))
                            
                            Divider()
                            
                            Toggle(isOn: $isDarkModeOn) {
                                HStack{
                                    Image(systemName: "moon")
                                        .imageScale(.large)
                                    Text("Dark Mode")
                                        .font(.system(size: 20))
                                }
                            }
                            .tint(Color(K.Colors.primaryColor))
                        }
                        .padding()
                    }
                    .padding()
                
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 110)
                    .foregroundColor(Color(K.Colors.tileColor))
                    .overlay{
                        VStack{
                            Toggle(isOn: $viewModel.isNotificationOn) {
                                HStack{
                                    Image(systemName: "bell.badge")
                                        .imageScale(.large)
                                    Text("Notification")
                                        .font(.system(size: 20))
                                }
                            }
                            .tint(Color(K.Colors.primaryColor))
                            
                            Divider()
                            
                            Toggle(isOn: $viewModel.shakeToReport) {
                                HStack{
                                    Image(systemName: "iphone.gen3.radiowaves.left.and.right.circle")
                                        .imageScale(.large)
                                    Text("Shake to report")
                                        .font(.system(size: 20))
                                }
                            }
                            .tint(Color(K.Colors.primaryColor))
                        }
                        .padding()
                    }
                    .padding()
                
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 110)
                    .foregroundColor(Color(K.Colors.tileColor))
                    .overlay{
                        VStack{
                            Button{
                                viewModel.showRemoveAllNewsAlert = true
                            }label: {
                                HStack{
                                    Image(systemName: "person.badge.key")
                                    Text("Deactivate Account")
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundColor(Color(UIColor.lightGray))
                                }
                            }
                            .tint(Color(UIColor.label))
                            .alert("Remove all saved news", isPresented: $viewModel.showRemoveAllNewsAlert) {
                                Button("No", role: .cancel) { }
                                Button("Yes", role: .destructive) {
                                    //                                dataService.deleteAllSaveNews()
                                    let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                                    impactMed.impactOccurred()
                                }
                            }
                            
                            Divider()
                            
                            HStack{
                                Image(systemName: "person.2.slash")
                                Text("Delete Account")
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(Color(UIColor.lightGray))
                            }
                        }
                        .padding()
                    }
                    .padding()
                
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 80)
                    .foregroundColor(Color(K.Colors.tileColor))
                    .overlay{
                        Button{
                            AuthManager.shared.signOut()
                        }label: {
                            Text("Log Out")
                                .fontWeight(.medium)
                                .font(.system(size: 22))
                                .tint(Color(UIColor.label))
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 55)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color(UIColor.label), lineWidth: 1)
                                }
                                .padding(10)
                        }
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom, 25)
            }
        }
        .background(Color(K.Colors.canvasColor))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
