//
//  SwiftUIView.swift
//  FreedayBeta
//
//  Created by Spencer Jones on 5/6/22.
//

import Firebase
import FirebaseAuth
import SwiftUI

struct MainTabBarView: View {
    
    @EnvironmentObject var session: SessionManager
    var user = Auth.auth().currentUser
    
    var body: some View {
        TabView {
            ProfileView()
                .environmentObject(session)
                .tabItem {
                    Image(systemName: "person.circle")
                        .foregroundColor(Color("limeGreen"))
                }
            Text("Messages")
                .tabItem {
                    Image(systemName: "message.circle")
                        .foregroundColor(Color("limeGreen"))
                }
            Text("Matches")
                .tabItem {
                    Image(systemName: "flame.circle")
                        .foregroundColor(Color("limeGreen"))
                }
            Text("Invite")
                .tabItem {
                    Image(systemName: "envelope.circle")
                        .foregroundColor(Color("limeGreen"))
                }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem {
                Button(action: {
                    do {
                        try session.authService.signOutUser()
                    } catch {
                        print("Sign Out Error")
                    }
                }, label: {
                    Text("Sign Out")
                })
            }
        }
    }
}

//struct MainTabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabBarView()
//    }
//}
