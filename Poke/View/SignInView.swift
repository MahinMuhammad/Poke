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
                    FormElements.InputFieldView(input: $viewModel.email, titleShown: "Email", warningMessage: $viewModel.emailWarning, isSecuredOn: false)
                    
                    FormElements.InputFieldView(input: $viewModel.password, titleShown: "Password", warningMessage: $viewModel.passwordWarning, isSecuredOn: true)
                    
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
                        if viewModel.isFormValid(){
                            print("sign in")
                        }
                    } label: {
                        FormElements.FormButtonLabelView(buttonTitle: "Sign In")
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
