//
//  Dummy.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/14/23.
//

import Foundation

class Dummy:ObservableObject{
    @Published var propic:URL? = URL(string: "https://picsum.photos/200")
    @Published var name:String = "Mahin Rahman"
    @Published var userName = "mahin.5"
    @Published var time:String = "5 min"
    @Published var numOfMessages = "1"
    
    static let email = "mahin@gmail.com"
    static let password = "123456"
}
