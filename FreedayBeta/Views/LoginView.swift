//
//  LoginView.swift
//  FreedayBeta
//
//  Created by Spencer Jones on 5/2/22.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var session: SessionManager
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State private var showingSignup = false
    @State private var loginError = false
    @State private var isLoginValid: Bool = false
    
    var body: some View {
            ZStack {
                VStack {
                    Image("freedayBus")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 20)
                    VStack {
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(Color("darkBlue"))
                            TextField("", text: $email)
                                .foregroundColor(Color("darkBlue"))
                                .keyboardType(.emailAddress)
                        }
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("darkBlue"), lineWidth: 1))
                        
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(Color("darkBlue"))
                            SecureField("", text: $password)
                                .foregroundColor(Color("darkBlue"))
                                .keyboardType(.asciiCapable)
                        }
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("darkBlue"), lineWidth: 1))
                        
                        if loginError {
                            Text(session.loginErrorMessage ?? "")
                        }
                        
                        HStack {
                            Button("Sign Up") {
                                showingSignup.toggle()
                            }
                            .buttonStyle(SecondaryButtonStyle())
                            .sheet(isPresented: $showingSignup) {
                                SignupView(viewModel: SignupViewModel(authService: session.authService))
                            }
                                
                            Spacer(minLength: 20)
                            NavigationLink(destination:
                                MainTabBarView()
                                    .environmentObject(session)
                            , isActive: $isLoginValid, label: {
                                Button("Sign In", action: {
                                    Task {
                                        do {
                                            try await session.login(email: email, password: password)
                                            self.isLoginValid = true
                                            session.getCurrentUser()
                                        } catch {
                                            print("ERROR")
                                        }
                                        
                                    }
                                })
                                .buttonStyle(PrimaryButtonStyle())
                            })
                        }
                        .padding(.top, 20)
                        
                        Button("Forgot password?", action: {print("Forgot password?")})
                            .foregroundColor(Color("darkBlue"))
                            .padding(.top, 20)
                    }
                    .padding(.horizontal, 40)
                    
                    Spacer()
                    
                }
                .padding()
            }
            .background(Color("limeGreen"))
            
        
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color("darkBlue") : Color("limeGreen"))
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(configuration.isPressed ? Color("limeGreen") : Color("darkBlue"))
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("darkBlue"), lineWidth: 2)))
    }
}
struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? Color("limeGreen") : Color("darkBlue"))
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(configuration.isPressed ? Color("darkBlue") : Color("limeGreen"))
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("darkBlue"), lineWidth: 2)))
    }
}
