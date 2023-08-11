//
//  MainView.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/11/23.
//

import SwiftUI

struct MainView: View {
    @State var isSignedIn = false
    var body: some View {
        if isSignedIn{
            
        }else{
            SignInView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
