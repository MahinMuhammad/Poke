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
    
    var body: some View {
        ScrollView{
            VStack{
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
                    .padding(.top,50)
                
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
                
                Button("Sign Out"){
                    AuthManager.shared.signOut()
                }
            }
            .background(Color(K.Colors.canvasColor))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
