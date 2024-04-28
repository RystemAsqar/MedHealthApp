//
//  AppDelegate.swift
//  MedHealthApp
//
//  Created by Rystem Asqar on 4/13/24.
//

import UIKit
import Firebase
import LogIn
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupFirebase()
        setupDependencies()
        return true
    }
    
    private func setupFirebase() {
        FirebaseApp.configure()
    }
    private func setupDependencies() {
        SignInDependencies.signInProvider = AuthenticationProvider()
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
       
    }


}

