//
//  SignUpView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
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

struct SignUpView: View {
    
    @StateObject var viewModel = SignUpViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
            ZStack{
                    Color(K.Colors.canvasColor)
                        .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack{
                            FormElements.InputFieldView(input: $viewModel.name, titleShown: "Name", warningMessage: $viewModel.nameWarning, isSecuredOn: false)
                            
                            FormElements.InputFieldView(input: $viewModel.userName, titleShown: "User Name", warningMessage: $viewModel.userNameWarning, isSecuredOn: false)
                            
                            FormElements.InputFieldView(input: $viewModel.email, titleShown: "Email", warningMessage: $viewModel.emailWarning, isSecuredOn: false)
                            
                            FormElements.InputFieldView(input: $viewModel.password, titleShown: "Password", warningMessage: $viewModel.passwordWarning, isSecuredOn: true)
                            
                            HStack {
                                Text("Already have an account?")
                                    .fontWeight(.semibold)
                                Button {
                                    self.presentationMode.wrappedValue.dismiss()
                                } label: {
                                    Text("Sign In")
                                        .underline()
                                        .fontWeight(.bold)
                                }
                                .foregroundColor(Color(UIColor.label))
                            }
                            .font(.system(size: 17))
                            
                            Button {
                                if viewModel.isFormValid(){
                                    viewModel.signUpPressed()
                                }
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
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(Router())
    }
}
