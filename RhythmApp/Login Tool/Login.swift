//
//  Login.swift
//  MusicApp
//
//  Created by Alyssa Feinberg on 2/17/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct Login: View {
    @EnvironmentObject private var authModel: AuthViewModel
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    @State var email = ""
    @State var password = ""
    @State var signUpPressed = false
    @State var signInPressed = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                //WHITE OR "WHITE"?
                Color("BrandWhite").edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    //
                    //                    Text("Music App").font(.custom("Quicksand-Bold", size: 30))
                    //                        .padding(.bottom, 59)
                    
                    Circle()
                        .frame(width: 200)
                        .foregroundColor(Color("BrandPeach"))
                    
                    //                    Image("DummyLogo")
                    //                        .resizable().frame(width: 100, height:100)
                    //                        .padding()
                    
                    VStack(spacing: 15) {
                        VStack(spacing: 8) {
                            HStack {
                                //                                Image(systemName: "envelope")
                                //                                    .foregroundColor(.black).frame(width: 15, height: 15)
                                Text("Email").font(.custom("Quicksand-Regular", size: 20))
                                Spacer()
                            }
                            
                            TextField("", text: self.$email)
                                .keyboardType(.emailAddress)
                                .padding(20)
                                .background(Color("BrandPeach"))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .foregroundColor(Color("BrandBlack"))
                            
                        }.padding(.bottom)
                        
                        
                        
                        VStack(spacing: 8) {
                            HStack {
                                //                                Image(systemName: "key")
                                //                                    .foregroundColor(.black).frame(width: 15, height: 15)
                                Text("Password").font(.custom("Quicksand-Regular", size: 20))
                                Spacer()
                            }
                            
                            SecureField("", text: self.$password)
                                .keyboardType(.emailAddress)
                                .padding(20)
                                .background(Color("BrandPeach"))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .foregroundColor(Color("BrandBlack"))
                        }
                        
                    }.padding()
                        .padding(.vertical, screenHeight/30)
                        .padding(.horizontal, 40)
                        .padding(.bottom, screenHeight/20)
                    
                    NavigationLink(destination: TabBarContainer().environmentObject(AuthViewModel()).navigationBarBackButtonHidden(true), isActive: $signInPressed) {
                        Text("Sign In")
                            .font(.custom("Quicksand-SemiBold", size: 20))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical, 25)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(Color("BrandBlack")).cornerRadius(8)
                            .shadow(radius: 5)
                            .onTapGesture {
                                login()
                                signInPressed.toggle()
                            }
                    }
                    
                    //get rid of padding
                    HStack(spacing: 5) {
                        Text("Don't have an account?")
                            .font(.custom("Quicksand-Regular", size: 18))
                            .foregroundColor(.gray)
                        NavigationLink(destination: SUName().environmentObject(AuthViewModel()).navigationBarBackButtonHidden(true), isActive: $signUpPressed) {
                            Button {
                                signUpPressed.toggle()
                            } label: {
                                Text("Sign up")
                                    .font(.custom("Quicksand-Regular", size: 18))
                                    .padding(.vertical)
                                //CHANGE COLOR
                                    .foregroundColor(Color("BrandGreen"))
                            }
                        }
                        
                    }
                    
                    Spacer()
                    
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            //check if the user is already logged in
        }
        .environmentObject(AuthViewModel())
        
    }
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

