//
//  ContentView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
//

import SwiftUI

struct SignInView: View {
    @State var email:String = ""
    @State var password:String = ""
    @State var passwordVisible = false
    var body: some View {
        NavigationStack{
            ZStack{
                Color(K.Colors.canvasColor)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(K.Colors.tileColor))
                        .overlay{
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(K.Colors.secondaryColor))
                                TextField("Email", text: $email)
                                    .padding(.all)
                            }
                        }
                        .padding(.all)
                        .frame(height: 100)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(K.Colors.tileColor))
                        .overlay{
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(K.Colors.secondaryColor))
                                HStack{
                                    if passwordVisible{
                                        TextField("Password", text: $password)
                                            .padding(.all)
                                    }else{
                                        SecureField("Password", text: $password)
                                            .padding(.all)
                                    }
                                    
                                    Button {
                                        passwordVisible.toggle()
                                    } label: {
                                        passwordVisible ? Image(systemName: "eye") : Image(systemName: "eye.slash.fill")
                                    }
                                    .foregroundColor(Color(UIColor.label))
                                    .padding(.all)
                                }
                            }
                        }
                        .padding(.all)
                        .frame(height: 100)
                    
                    
                    
                    Button {
                        print("sign in")
                    } label: {
                        RoundedRectangle(cornerRadius: 26)
                            .foregroundColor(Color(K.Colors.primaryColor))
                            .overlay{
                                Text("Sign In")
                                    .foregroundColor(Color(UIColor.label))
                                    .font(.system(size: 25))
                            }
                            .padding(.all)
                            .frame(height: 90)
                    }
                    
                    Spacer()
                }
                .navigationTitle("Sign In")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
