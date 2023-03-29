//
//  SUEmail.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/28/23.
//

import SwiftUI

struct SUEmail: View {
    @EnvironmentObject private var authModel: AuthViewModel
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    @State var email = ""
    @State var continuePressed = false
    @State var empty = false
    @State var noAt = false
    
    var body: some View {
        ZStack {
            
            Color("BrandLightGreen").opacity(0.35).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 15) {
                Text("What's your email?")
                    .bold()
                    .font(.title3)
                    .padding(.vertical, screenHeight/15)
                
                HStack(spacing: 15) {
                    Image(systemName: "envelope")
                        .foregroundColor(.black).frame(width: 15, height: 15)
                    
                    TextField("Email", text: self.$email)
                        .keyboardType(.emailAddress)
                }
                
                Divider()
                
                if noAt {
                    Text("Please enter a valid email.")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                NavigationLink(destination: SUPassword().environmentObject(AuthViewModel()).navigationBarBackButtonHidden(true), isActive: $continuePressed) {
                    Text("CONTINUE")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color("BrandGreen")).cornerRadius(8)
                        .shadow(radius: 5)
                        .onTapGesture {
                            noAt = false
                            empty = false
                            
                            
                            if !email.contains("@") {
                                noAt = true
                                return
                            }
                            
                            if email == "" {
                                empty = true
                                return
                            }
                            
                            //WILL NO LONGER CHECK IF EMAIL IS ALREADY USED
                            NewUser.email = email
                            continuePressed.toggle()
                        }
                }
                
            }.padding()
                .padding(.vertical, screenHeight/20)
                .padding(.horizontal, 40)
            
        }
    }
}

struct SUEmail_Previews: PreviewProvider {
    static var previews: some View {
        SUEmail()
    }
}
