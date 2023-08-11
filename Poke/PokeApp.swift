//
//  PokeApp.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
//

import SwiftUI

@main
struct PokeApp: App {
    @ObservedObject var router = Router()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path){
                MainView() //MainView is actually NavigationStack for whole app
                    .onAppear {
                    #if DEBUG
                                        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                    #endif
                    }
            }
            .environmentObject(router)
        }
    }
}
