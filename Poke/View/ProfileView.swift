//
//  ProfileView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 9/6/23.
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
import PhotosUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject var viewModel: ProfileViewModel
    var body: some View {
        ZStack{
            Color(K.Colors.canvasColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if verticalSizeClass == .compact{
                    Button {
                        dismiss()
                    }label: {
                        Image(systemName: "chevron.left")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .imageScale(.large)
                            .foregroundStyle(Color(K.Colors.fontColor))
                    }
                }
                Menu{
                    Button {
                        viewModel.shouldPresentFullPicture = true
                    } label: {
                        Text("View Picture")
                    }
                    Button {
                        viewModel.shouldPresentPhotoPicker = true
                    } label: {
                        Text("Update Picture")
                    }
                } label: {
                    AsyncImage(url: viewModel.user?.profilePictureUrl){  image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color(K.Colors.secondaryColor), lineWidth: 3.5)
                            )
                    }placeholder: {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .clipShape(Circle())
                            .tint(Color(UIColor.label))
                            .overlay(
                                Circle().stroke(Color(K.Colors.secondaryColor), lineWidth: 3.5)
                            )
                    }
                    .padding(.top, -20)
                }
                
                Text(viewModel.user?.name ?? "Loading Failed")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(Color(K.Colors.fontColor))
                
                Divider()
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 50)
                    .foregroundColor(Color(K.Colors.fieldColor))
                    .overlay{
                        HStack{
                            Image(systemName: "envelope.fill")
                                .imageScale(.large)
                                .foregroundColor(Color(K.Colors.primaryColor))
                            Text(viewModel.user?.email ?? "Loading Failed")
                                .tint(Color(K.Colors.fontColor))
                        }
                    }
                
            }
            .padding()
            
            if !viewModel.userLoaded(){
                Color(K.Colors.canvasColor)
                    .edgesIgnoringSafeArea(.all)
                Text("Loading..")
                    .font(.largeTitle)
            }
        }
        .sheet(isPresented: $viewModel.shouldPresentFullPicture){
            PictureView(viewModel: PictureViewModel(imageUrl: viewModel.user?.profilePictureUrl))
        }
        .photosPicker(isPresented: $viewModel.shouldPresentPhotoPicker, selection: $viewModel.selectedPickerItem, matching: .images)
        .onChange(of: viewModel.selectedPickerItem) { newItem in
            if let newItem{
                viewModel.selectedPickerItemChanged(to: newItem)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}
