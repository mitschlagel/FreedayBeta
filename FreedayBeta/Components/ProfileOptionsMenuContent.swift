//
//  ProfileOptionsView.swift
//  FreedayBeta
//
//  Created by Spencer Jones on 5/6/22.
//

import SwiftUI

struct ProfileOptionsMenuContent: View {
       
    var body: some View {
        
        List {
            HStack {
                Text("Edit Profile")
                Spacer()
                Image(systemName: "pencil")
            }
            HStack {
                Text("Account Settings")
                Spacer()
                Image(systemName: "gear")
            }

            HStack {
                Text("Log Out")
                Spacer()
                Image(systemName: "hand.wave")
            }

        }
        
    }
}

//struct ProfileOptionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileOptionsView()
//    }
//}
