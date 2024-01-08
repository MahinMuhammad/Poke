//
//  PokeApp.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 8/10/23.
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
    
    @AppStorage("appTheme") private var isDarkModeOn = false
    let currentSystemScheme = UITraitCollection.current.userInterfaceStyle
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path){
                TabBarView()
                    .onAppear {
                    #if DEBUG
                                        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                    #endif
                    }
            }
            .environmentObject(router)
            .onAppear {
                isDarkModeOn = (currentSystemScheme == .dark)
            }
            .preferredColorScheme(isDarkModeOn ? .dark : .light)
        }
    }
}

//MARK: - UIGestureRecognizerDelegate
//to implement swipe back with navigationbarhidden()
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1 && AuthManager.shared.isSignedIn
    }
}
