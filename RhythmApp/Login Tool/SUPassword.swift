//
//  SUPassword.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/28/23.
//

import SwiftUI

import SwiftUI
import FirebaseAuth
import FirebaseCore

struct SUPassword: View {
    @EnvironmentObject private var authModel: AuthViewModel
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    @State var password = ""
    @State var confirmPassword = ""
    @State var continuePressed = false
    @State var mismatch = false
    @State var empty = false
    
    var body: some View {
        ZStack {
            
            Color("BrandLightGreen").opacity(0.35).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 15) {
                Text("What's your password?")
                    .bold()
                    .font(.title3)
                    .padding(.vertical, screenHeight/20)
                
                HStack(spacing: 15) {
                    Image(systemName: "key")
                        .foregroundColor(.black).frame(width: 15, height: 15)
                    
                    SecureField("Password", text: self.$password)
                }
                
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "key")
                        .foregroundColor(.black)
                        .frame(width: 15, height: 15)
                    
                    SecureField("Confirm Password", text: self.$confirmPassword)
                }
                
                Divider()
                
                if mismatch {
                    Text("Passwords don't match!")
                        .font(.footnote)
                        .foregroundColor(.red)
                }

                if empty {
                    Text("Password can't be blank!")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                NavigationLink(destination: SUWelcome().environmentObject(AuthViewModel()).navigationBarBackButtonHidden(true), isActive: $continuePressed) {
                    Text("CREATE ACCOUNT")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color("BrandGreen")).cornerRadius(8)
                        .shadow(radius: 5)
                        .onTapGesture {
                            mismatch = false
                            empty = false
                            
                            if password == "" {
                                empty = true
                            } else if password != confirmPassword {
                                mismatch = true
                            } else {
                                NewUser.password = password
                                //FIREBASE
                                authModel.signUp( emailAddress: NewUser.email!, password: NewUser.password!)
                                
                            }
                            continuePressed.toggle()
                        }
                }
                
            }.padding()
                .padding(.vertical, screenHeight/20)
                .padding(.horizontal, 40)
            
        }
    }
}

struct SUPassword_Previews: PreviewProvider {
    static var previews: some View {
        SUPassword()
    }
}

