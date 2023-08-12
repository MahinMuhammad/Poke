//
//  ContentView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color(K.Colors.canvasColor)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack{
                        FormElements.InputFieldView(input: $viewModel.email, titleShown: "Email", warningMessage: $viewModel.emailWarning, isSecuredOn: false)
                        
                        FormElements.InputFieldView(input: $viewModel.password, titleShown: "Password", warningMessage: $viewModel.passwordWarning, isSecuredOn: true)
                        
                        HStack {
                            Text("Don't have an account?")
                                .fontWeight(.semibold)
                            NavigationLink(destination: SignUpView()) {
                                Text("Sign Up")
                                    .underline()
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(Color(UIColor.label))
                        }
                        .font(.system(size: 17))
                        
                        Button {
                            if viewModel.isFormValid(){
                                viewModel.signInPressed()
                            }
                        } label: {
                            FormElements.FormButtonLabelView(buttonTitle: "Sign In")
                        }
                        
                        Spacer()
                    }
                    .navigationTitle("Sign In")
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
