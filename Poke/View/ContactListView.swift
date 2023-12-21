//
//  FriendListView.swift
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

struct ContactListView: View {
    @StateObject var viewModel = ContactListViewModel()
    var body: some View {
        NavigationStack {
            ZStack{
                Color(K.Colors.canvasColor)
                    .ignoresSafeArea()
                
                VStack{
                    HStack {
                        Text("Contacts")
                            .fontWeight(.bold)
                            .font(.system(size: 32))
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis.circle")
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
                                
                                TextField("Search with name or email", text: $viewModel.searchBarInput)
                                    .tint(Color(UIColor.label))
                                    .padding(.all)
                            }
                            .padding(.leading, 40)
                        }
                    
                    List(0..<10) {_ in
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 80)
                            .foregroundColor(Color(K.Colors.fieldColorDark))
                            .listRowBackground(Color(K.Colors.canvasColor))
                            .listRowSeparator(.hidden)
                            .overlay{
                                HStack{
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
                                    
                                    VStack(alignment: .leading){
                                        Text(Dummy.name)
                                            .font(.title2)
                                        Text(Dummy.email)
                                            .foregroundStyle(.gray)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                            }
                    }
                    .listStyle(.plain)
                }
            }
        }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
