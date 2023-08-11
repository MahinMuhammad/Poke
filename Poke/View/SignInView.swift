//
//  ContentView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject private var viewModel = SignInViewModel()
    @EnvironmentObject var router: Router

    var body: some View {
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
                                TextField("Email", text: $viewModel.email)
                                    .tint(Color(UIColor.label))
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
                                    if viewModel.passwordVisible{
                                        TextField("Password", text: $viewModel.password)
                                            .tint(Color(UIColor.label))
                                            .padding(.all)
                                    }else{
                                        SecureField("Password", text: $viewModel.password)
                                            .tint(Color(UIColor.label))
                                            .padding(.all)
                                    }
                                    
                                    Button {
                                        viewModel.showPasswordPressed()
                                    } label: {
                                        Image(systemName: viewModel.getEyeImage())
                                    }
                                    .foregroundColor(Color(UIColor.label))
                                    .padding(.all)
                                }
                            }
                        }
                        .padding(.all)
                        .frame(height: 100)
                    
                    HStack {
                        Text("Don't have an account?")
                            .fontWeight(.semibold)
                        NavigationLink(value: Destination.signUp) {
                            Text("Sign Up")
                                .underline()
                                .fontWeight(.bold)
                        }
                        .foregroundColor(Color(UIColor.label))
                    }
                    .font(.system(size: 17))
                    
                    Button {
                        print("sign in")
                    } label: {
                        RoundedRectangle(cornerRadius: 26)
                            .foregroundColor(Color(K.Colors.primaryColor))
                            .overlay{
                                Text("Sign In")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 25))
                            }
                            .padding(.all)
                            .frame(height: 90)
                    }
                    
                    Spacer()
                }
                .navigationTitle("Sign In")
                .navigationDestination(for: Destination.self) { destination in
                    ViewFactory.viewForDestination(destination)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
