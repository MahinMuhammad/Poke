//
//  FormElements.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
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

import Foundation
import SwiftUI

struct FormElements{
    
    //MARK: - InputFieldView
    struct InputFieldView: View {
        @Binding var input:String
        let titleShown: String
        @Binding var warningMessage:String?
        let isSecuredOn:Bool
        @State private var isPasswordVisible: Bool = false
        var body: some View {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(K.Colors.tileColor))
                    .overlay{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(K.Colors.secondaryColor))
                            HStack{
                                if isPasswordVisible || !isSecuredOn{
                                    TextField(titleShown, text: $input)
                                        .tint(Color(UIColor.label))
                                        .padding(.all)
                                }else{
                                    SecureField(titleShown, text: $input)
                                        .tint(Color(UIColor.label))
                                        .padding(.all)
                                }
                                
                                if isSecuredOn{
                                    Button {
                                        isPasswordVisible.toggle()
                                    } label: {
                                        isPasswordVisible ? Image(systemName: "eye") : Image(systemName: "eye.slash.fill")
                                    }
                                    .foregroundColor(Color(UIColor.label))
                                    .padding(.all)
                                }
                            }
                        }
                    }
                    .padding(.all)
                    .frame(height: 100)
                Text(warningMessage ?? "")
                    .foregroundColor(.red)
        }
    }
    
    //MARK: - FormButtonLabelView
    struct FormButtonLabelView: View {
        let buttonTitle:String
        var body: some View {
            RoundedRectangle(cornerRadius: 26)
                .foregroundColor(Color(K.Colors.primaryColor))
                .overlay{
                    Text(buttonTitle)
                        .foregroundColor(Color.white)
                        .font(.system(size: 25))
                }
                .padding(.all)
                .frame(height: 90)
        }
    }
}
