//
//  PokeApp.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct PokeApp: App {
    @ObservedObject var router = Router()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
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
