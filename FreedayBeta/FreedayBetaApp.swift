//
//  FreedayBetaApp.swift
//  FreedayBeta
//
//  Created by Spencer Jones on 5/2/22.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct FreedayBetaApp: App {
    
    @StateObject var session = SessionManager()
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                InitialView()
                    .environmentObject(session)
            }
            
            
        }
    }
}

