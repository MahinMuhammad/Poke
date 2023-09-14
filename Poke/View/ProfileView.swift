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

struct ProfileView: View {
    @StateObject var d = Dummy()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color(K.Colors.canvasColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button("back") {
                    dismiss()
                }
                AsyncImage(url: d.propic){  image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color(K.Colors.secondaryColor), lineWidth: 3.5)
                        )
                }placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color(red: 0.29, green: 0.29, blue: 0.29), lineWidth: 3.5)
                        )
                }
                
                Text("Mahin Rahman")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(Color(K.Colors.fontColor))
                
                Text(d.userName)
                    .foregroundColor(Color(K.Colors.fontColor))
                    .font(.system(size: 25))
                
                Divider()
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 50)
                    .foregroundColor(Color(K.Colors.filedColor))
                    .overlay{
                        HStack{
                            Image(systemName: "envelope.fill")
                                .imageScale(.large)
                                .foregroundColor(Color(K.Colors.primaryColor))
                            Text("rahmanmahin@icloud.com")
                                .tint(Color(K.Colors.fontColor))
                        }
                    }
            }
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
