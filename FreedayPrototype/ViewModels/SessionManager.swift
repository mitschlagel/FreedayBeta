//
//  LoginViewModel.swift
//  FreedayPrototype
//
//  Created by Spencer Jones on 1/3/23.
//

import Firebase
import FirebaseAuth
import Foundation

class SessionManager: ObservableObject {
    
    let authService = AuthService()
    
    @Published var currentUser: FirebaseAuth.User?
    @Published var loginErrorMessage: String?
    
    func login(email: String, password: String) async  throws {
        do {
            try await authService.signInUser(email: email, password: password)
        } catch {
            print(error)
        }
        
    }
    
    func getCurrentUser() -> FirebaseAuth.User? {
        var currentUser: FirebaseAuth.User?
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                currentUser = user
            }
        }
        return currentUser
    }
}
