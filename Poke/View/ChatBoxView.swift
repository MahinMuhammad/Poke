//
//  ChatBoxView.swift
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

import SwiftUI

struct ChatBoxView: View {
    @EnvironmentObject var router: Router
    @ObservedObject var viewModel: ChatBoxViewModel
    @Environment(\.colorScheme) var colorScheme //for smilling face
    
    init(sending:String, receiving:String){
        self.viewModel = ChatBoxViewModel(senderEmail: sending, receiverEmail: receiving)
    }
    var body: some View {
        ZStack{
            Color(K.Colors.canvasColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Button {
                        router.popToRoot()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .frame(width: 25, height: 20)
                            .foregroundColor(Color(UIColor.label))
                            .imageScale(.large)
                            .bold()
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Mahin Rahman")
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                            .lineLimit(1)
                        
                        Spacer()
                            .frame(height: 10)
                        
                        Text("Last Online at 10:45 AM")
                            .foregroundColor(.gray)
                            .fontWeight(.regular)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                    .frame(width: 185)
                    
                    Spacer()
                    
                    AsyncImage(url: Dummy.propic){  image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 60)
                            .clipped()
                            .clipShape(Circle())
                    }placeholder: {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 60)
                            .clipped()
                            .clipShape(Circle())
                    }
                }
                .padding(.all)
                .padding(.top, 15)
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 35)
                    .foregroundColor(Color(K.Colors.fieldColor))
                    .padding(.bottom, -35)
                    .padding(.top, 5)
                    .overlay{
                        VStack{
                            List(viewModel.chatCollection){ chat in
                                if chat.senderEmail == "mahin@example.com"{
                                    VStack(alignment: .trailing){
                                        Text(chat.content)
                                            .fontWeight(.regular)
                                            .font(.system(size: 17))
                                            .padding()
                                            .background {
                                                Color(K.Colors.primaryColor)
                                                    .cornerRadius(15)
                                            }
                                        
                                        Text("10:30 PM")
                                            .foregroundColor(.gray)
                                            .fontWeight(.regular)
                                            .font(.system(size: 15))
                                            .padding(.trailing, 5)
                                    }
                                    .padding(.leading, 50)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .listRowSeparator(.hidden)
                                    .listRowBackground(Color(K.Colors.fieldColor))
                                }else{
                                    VStack(alignment: .leading){
                                        Text(chat.content)
                                            .fontWeight(.regular)
                                            .font(.system(size: 17))
                                            .padding()
                                            .background {
                                                Color(K.Colors.secondaryColor)
                                                    .cornerRadius(15)
                                            }
                                        
                                        Text("10:30 PM")
                                            .foregroundColor(.gray)
                                            .fontWeight(.regular)
                                            .font(.system(size: 15))
                                            .padding(.leading, 5)
                                    }
                                    .padding(.trailing, 50)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .listRowSeparator(.hidden)
                                    .listRowBackground(Color(K.Colors.fieldColor))
                                }
                            }
                            .listStyle(.plain)
                            .padding(.top, 45)
                            
                            Spacer()
                            
                            HStack{
                                RoundedRectangle(cornerRadius: 24)
                                    .foregroundColor(Color(K.Colors.fieldColorDark))
                                    .overlay{
                                        HStack{
                                            Button {
                                                
                                            } label: {
                                                Image(systemName: "plus")
                                                    .foregroundColor(Color(UIColor.label))
                                                    .imageScale(.large)
                                                    .fontWeight(.semibold)
                                            }
                                            
                                            TextField("Message...", text: $viewModel.message)
                                                .tint(Color(UIColor.label))
                                                .padding()
                                            
                                            Button {
                                                
                                            } label: {
                                                Image(systemName:(colorScheme == .dark ? "face.smiling.fill" : "face.smiling"))
                                                    .foregroundColor(Color(UIColor.label))
                                                    .imageScale(.large)
                                                    .fontWeight(.semibold)
                                            }
                                            
                                        }
                                        .padding(.leading, 20)
                                        .padding(.trailing, 20)
                                    }
                                
                                Circle()
                                    .foregroundColor(Color(K.Colors.fieldColorDark))
                                    .overlay{
                                        Button {
                                            
                                        } label: {
                                            Image(systemName: "mic")
                                                .foregroundColor(Color(UIColor.label))
                                                .imageScale(.large)
                                                .fontWeight(.semibold)
                                        }
                                        
                                    }
                            }
                            .frame(height: 50)
                            .padding(.leading, 20)
                            .padding(.bottom, -10)
                            .padding(.trailing, 20)
                        }
                    }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct ChatBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBoxView(sending: "", receiving: "")
            .environmentObject(Router())
    }
}
