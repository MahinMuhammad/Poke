//
//  Dummy.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/14/23.
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

class Dummy:ObservableObject{
    @Published var propic:URL? = URL(string: "https://picsum.photos/200")
    @Published var name:String = "Mahin Rahman"
    @Published var userName = "mahin.5"
    @Published var time:String = "5 min"
    @Published var numOfMessages = "1"
    
    static let email = "mahin@gmail.com"
    static let password = "123456"
}
