//
//  ChatListView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import SwiftUI

struct ChatListView: View {
    @StateObject var viewModel = ChatListViewModel()
    @StateObject var d = Dummy()
    @State var searchBarInput = ""
    var body: some View {
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
                .foregroundColor(Color(K.Colors.tileColor))
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
                        AsyncImage(url: d.propic){  image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipped()
                                .clipShape(Circle())
                        }placeholder: {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipped()
                                .clipShape(Circle())
                        }
                        
                        Spacer()
                            .frame(width: 20)
                        
                        VStack(alignment: .leading){
                            Text(d.name)
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
                            Text(d.time)
                                .foregroundColor(Color.gray)
                                .fontWeight(.thin)
                            
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(Color(K.Colors.primaryColor))
                                .frame(width: 20, height: 20)
                                .overlay{
                                    Text(d.numOfMessages)
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

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
