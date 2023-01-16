//
//  LoginViewModel.swift
//  FreedayBeta
//
//  Created by Spencer Jones on 1/3/23.
//

import Firebase
import FirebaseAuth
import Foundation

class SessionManager: ObservableObject {
    
    let authService = AuthService()
    @Published var loginErrorMessage: String?
    @Published var currentUser: Firebase.User?
    
    func login(email: String, password: String) async throws {
        do {
            try await authService.signInUser(email: email, password: password)
        } catch {
            print(error)
        }
        
    }
    
    func getCurrentUser() {
        if let user = Auth.auth().currentUser {
            self.currentUser = user
        }
    }
}
