//
//  ProfileView.swift
//  FreedayPrototype
//
//  Created by Spencer Jones on 5/6/22.
//

import Firebase
import FirebaseAuth
import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
            VStack {
                Text(session.currentUser?.email ?? "Error")
            }
            .navigationTitle("Profile")
            
        }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
