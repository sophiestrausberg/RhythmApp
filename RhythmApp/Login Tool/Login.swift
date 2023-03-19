//
//  Login.swift
//  MusicApp
//
//  Created by Alyssa Feinberg on 2/17/23.
//

import SwiftUI

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct Login: View {
//    let screenHeight = UIScreen.main.bounds.height
//    let screenWidth = UIScreen.main.bounds.width
    @State var email = ""
    @State var password = ""
    @State var faceIdEnabled = false
    @State var signUpPressed = false
    
    var body: some View {
//        NavigationView {
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
//                                .keyboardType(.emailAddress)
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
//                                .keyboardType(.emailAddress)
                                .padding(20)
                                .background(Color("BrandPeach"))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .foregroundColor(Color("BrandBlack"))
                        }
                        
                        if let mess = loginStatusMessage {
                            Text(mess).font(.footnote).foregroundColor(.red)
                        }
                        
                    }.padding()
//                        .padding(.vertical, screenHeight/30)
                        .padding(.horizontal, 40)
//                        .padding(.bottom, screenHeight/20)

                    
                    
                    Text("Sign In")
                        .font(.custom("Quicksand-SemiBold", size: 20))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical, 25)
//                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color("BrandBlack")).cornerRadius(8)
                        .shadow(radius: 5)
                        .onTapGesture {
                            signInPressed()
                        }
                    
                    //get rid of padding
                    
                    HStack(spacing: 5) {
                        Text("Don't have an account?")
                            .font(.custom("Quicksand-Regular", size: 18))
                            .foregroundColor(.gray)
                        
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
                    
                    Spacer()
                    
//                    NavigationLink(destination: SUName().navigationBarBackButtonHidden(false).navigationTitle("").foregroundColor(.black), isActive: $signUpPressed) {
//                        Text("")
//                    }
                    
                }
//            }.navigationBarTitle("")
            
        }
        .onAppear {
            //check if the user is already logged in
        }
    }
    
    @State var loginStatusMessage: String?
    
    private func signInPressed() {
//        Auth.auth().signIn(withEmail: email, password: password) {
//            result, error in
//
//            if let err = error {
//                print("FALIED TO LOG IN USER: \(err)")
//                self.loginStatusMessage = "\(err)"
//                return
//            }
//
//            //could change login status, but won't be necissary once we change views
//            print("SUCESSFULLY LOGGED IN USER: \(result?.user.uid ?? "")")
//        }
    }
}

struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
          //  .foregroundColor(checked ? Color(UIColor.systemGreen) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

