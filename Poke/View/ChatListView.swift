//
//  ChatListView.swift
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

struct ChatListView: View {
    @EnvironmentObject var router: Router
    @StateObject var viewModel = ChatListViewModel()
    @State var searchBarInput = ""
    var body: some View {
        NavigationStack(path: $router.path){
            VStack {
                HStack {
                    Text("Messages")
                        .fontWeight(.bold)
                        .font(.system(size: 32))
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(Color.gray)
                            .imageScale(.large)
                    }
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 40)
                
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(Color(K.Colors.fieldColor))
                    .frame(height: 40)
                    .padding(.all)
                    .overlay {
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            
                            TextField("Search for messages or users", text: $searchBarInput)
                                .tint(Color(UIColor.label))
                                .padding(.all)
                        }
                        .padding(.leading, 40)
                    }
                
                List(viewModel.chatCollection){ chat in
                    NavigationLink(value: chat) {
                        HStack(alignment: .top){
                            AsyncImage(url: Dummy.propic){  image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .clipShape(Circle())
                            }placeholder: {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .clipShape(Circle())
                            }
                            
                            Spacer()
                                .frame(width: 20)
                            
                            VStack(alignment: .leading){
                                Text(Dummy.name)
                                    .fontWeight(.bold)
                                    .font(.system(size: 20))
                                
                                Spacer()
                                    .frame(height: 10)
                                
                                Text(chat.content)
                                    .lineLimit(3)
                                    .fontWeight(.regular)
                                    .font(.system(size: 17))
                            }
                            
                            Spacer()
                            
                            VStack{
                                Text(Dummy.time)
                                    .foregroundColor(Color.gray)
                                    .fontWeight(.thin)
                                
                                RoundedRectangle(cornerRadius: 6)
                                    .foregroundColor(Color(K.Colors.primaryColor))
                                    .frame(width: 20, height: 20)
                                    .overlay{
                                        Text(Dummy.numOfMessages)
                                            .foregroundColor(Color.white)
                                            .fontWeight(.bold)
                                    }
                            }
                            .padding(.trailing,10)
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color(K.Colors.canvasColor))
                    .padding(.bottom, 25)
                    .padding(.trailing,-27)
                }
                .listStyle(.plain)
                .navigationDestination(for: Chat.self) { chat in
                    ChatBoxView(sending: chat.senderEmail, receiving: chat.receiverEmail)
                }
            }
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
            .environmentObject(Router())
    }
}
