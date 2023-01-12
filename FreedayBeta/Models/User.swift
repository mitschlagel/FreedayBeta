//
//  User.swift
//  FreedayBeta
//
//  Created by Spencer Jones on 5/3/22.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var userId: Int
    var fullName: String
    var birthday: String
    var phone: String
    var email: String
    var affiliation: String
    var password: String
}


