//
//  SignupView.swift
//  FreedayPrototype
//
//  Created by Spencer Jones on 5/3/22.
//

import SwiftUI
import UIKit

struct SignupView: View {
    
    enum FocusedField {
        case fullName, birthday, email, phone, affiliation, password, confirmPassword
    }
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: SignupViewModel
    
    @FocusState private var focusedField: FocusedField? //TODO: use this? hahaha
    @State var fullName: String = ""
    @State var birthday: String = ""
    @State var email = ""
    @State var phone = ""
    @State var affiliation = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Button(action: {dismiss()}, label: {Text("Already registered?").font(.caption2)})
                }
                Text("Sign Up").font(Font.custom("GillSans-UltraBold", size: 45))
                Text("And start having fun on freedays!").font(.body).padding(.top, -20)
            }
            .foregroundColor(Color("darkBlue"))
            .padding([.top, .bottom], 20)
            
            VStack(spacing: 10) {
                VStack(alignment: .leading) {
                    Text("Full Name")
                        .font(.caption)
                        .bold()
                    TextField("Full Name", text: $fullName) // to add the custom icon on the right these will need to be their own custom viewsye
                        .textFieldStyle(SignupTextFieldStyle())
                }
                VStack(alignment: .leading) {
                    Text("Birthday")
                        .font(.caption)
                        .bold()
                    TextField("Birthday", text: $birthday)
                        .textFieldStyle(SignupTextFieldStyle())
                }
                VStack(alignment: .leading) {
                    Text("Phone Number")
                        .font(.caption)
                        .bold()
                    TextField("Phone Number", text: $phone)
                        .textFieldStyle(SignupTextFieldStyle())
                }
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.caption)
                        .bold()
                    TextField("Email", text: $email)
                        .textFieldStyle(SignupTextFieldStyle())
                }
                VStack(alignment: .leading) {
                    Text("Affiliation")
                        .font(.caption)
                        .bold()
                    TextField("Affiliation", text: $affiliation)
                        .textFieldStyle(SignupTextFieldStyle())
                }
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.caption)
                        .bold()
                    TextField("Password", text: $password)
                        .textFieldStyle(SignupTextFieldStyle())
                }
                VStack(alignment: .leading) {
                    Text("Confirm Password")
                        .font(.caption)
                        .bold()
                    TextField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(SignupTextFieldStyle())
                }
            }
            .padding(.bottom, 20)
            .foregroundColor(Color("darkBlue"))
            
            
            Button("Sign Up") {
                let user = viewModel.createUser(fullName: fullName, birthday: birthday, phone: phone, email: email,
                                                affiliation: affiliation, password: password)
                viewModel.addUser(user)
                print(user)
                print(viewModel.users.count)
                dismiss()
                
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Spacer()
        }
        .padding([.trailing, .leading], 40)
        .background(Color("limeGreen"))
    }
}

//struct SignupView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignupView()
//    }
//}

struct SignupTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(.white).clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("darkBlue"), lineWidth: 1))
            .font(.subheadline)
    }
}

