//
//  ProfileView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 9/6/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var d = Dummy()
    var body: some View {
        ZStack{
            Color(K.Colors.canvasColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
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
                    .foregroundColor(Color(K.Colors.tileColor))
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
