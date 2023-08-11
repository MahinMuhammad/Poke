//
//  SignUpView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel = SignUpViewModel()
    @EnvironmentObject var router: Router
    
    var body: some View {
            ZStack{
                    Color(K.Colors.canvasColor)
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        FormElements.InputFieldView(input: $viewModel.name, titleShown: "Name", warningMessage: $viewModel.nameWarning, isSecuredOn: false)
                        
                        FormElements.InputFieldView(input: $viewModel.userName, titleShown: "User Name", warningMessage: $viewModel.userNameWarning, isSecuredOn: false)
                        
                        FormElements.InputFieldView(input: $viewModel.email, titleShown: "Email", warningMessage: $viewModel.emailWarning, isSecuredOn: false)
                        
                        FormElements.InputFieldView(input: $viewModel.password, titleShown: "Password", warningMessage: $viewModel.passwordWarning, isSecuredOn: true)
                        
                        HStack {
                            Text("Already have an account?")
                                .fontWeight(.semibold)
                            Button {
                                router.popToRoot()
                            } label: {
                                Text("Sign In")
                                    .underline()
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(Color(UIColor.label))
                        }
                        .font(.system(size: 17))
                        
                        Button {

                        } label: {
                            FormElements.FormButtonLabelView(buttonTitle: "Sign Up")
                        }
                        
                        Spacer()
                    }
                    .navigationTitle("Sign Up")
                    .navigationBarBackButtonHidden(true)
                    .swipeActions {
                        SignInView()
                    }
            }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(Router())
    }
}
