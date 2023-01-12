//
//  AuthService.swift
//  FreedayBeta
//
//  Created by Spencer Jones on 1/2/23.
//

import Firebase
import FirebaseAuth
import Foundation


class AuthService {
    
    enum AuthStatus {
        case error, success
    }
    
    func createAccount(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Account creation failed, error: \(error)")
                return
            }
            print("Created account for \(result?.user.uid ?? "")")
        }
    }
    
    func signInUser(email: String, password: String) async throws {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed, error: \(error)")
                return
            }
            print("\(result?.user.uid ?? "") signed in successfully.")
        }
    }
    
    func signOutUser() throws -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        }
        catch {
            print(error)
            return false
        }
    }
}
