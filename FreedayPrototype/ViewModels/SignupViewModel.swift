//
//  SignupViewModel.swift
//  FreedayPrototype
//
//  Created by Spencer Jones on 5/4/22.
//

import Foundation

class SignupViewModel: ObservableObject {
    
    var authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    @Published private(set) var users: [User] = []
    
    func createUser(fullName: String, birthday: String, phone: String, email: String,
                    affiliation: String, password: String) -> User {
        
        // Register user on Firebase
        authService.createAccount(email: email, password: password)
        
        let userCount = self.users.count
        
        
        return User(userId: userCount, fullName: fullName, birthday: birthday, phone: phone,
                    email: email, affiliation: affiliation, password: password)
    }
    
    func addUser(_ user: User) {
        users.append(user)
    }
}
