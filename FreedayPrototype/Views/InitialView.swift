//
//  InitialView.swift
//  FreedayPrototype
//
//  Created by Spencer Jones on 1/3/23.
//


import SwiftUI

struct InitialView: View {
    
    @EnvironmentObject var session: SessionManager
    var body: some View {
        
            if session.currentUser != nil {
                MainTabBarView()
                    .environmentObject(session)
            } else {
                LoginView()
                    .environmentObject(session)
            }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
