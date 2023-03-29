//
//  SUName.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/28/23.
//

import SwiftUI

struct SUName: View {
    @EnvironmentObject private var authModel: AuthViewModel
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    @State var firstName = ""
    @State var lastName = ""
    @State var continuePressed = false
    @State var empty = false

    var body: some View {
        NavigationStack{
            ZStack {
                
                Color("BrandLightGreen").opacity(0.35).edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 15) {
                    Text("What's your name?")
                        .bold()
                        .font(.title3)
                        .padding(.vertical, screenHeight/20)
                    
                    HStack(spacing: 15) {
                        Image(systemName: "person")
                            .foregroundColor(.black).frame(width: 15, height: 15)
                        
                        TextField("First Name", text: self.$firstName)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 15) {
                        Image(systemName: "person")
                            .foregroundColor(.black)
                            .frame(width: 15, height: 15)
                        
                        TextField("Last Name", text: self.$lastName)
                    }
                    
                    Divider()
                    if empty {
                        Text("Name can't be blank!")
                            .font(.footnote)
                            .foregroundColor(.red)
                    }
                    //                    .padding(.bottom, 40)
                    
                    Spacer()
                    
                    NavigationLink(destination: SUEmail().environmentObject(AuthViewModel()).navigationBarBackButtonHidden(true), isActive: $continuePressed) {
                        Text("CONTINUE")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(Color("BrandGreen")).cornerRadius(8)
                            .shadow(radius: 5)
                            .onTapGesture {
                                empty = false
                                
                                if firstName == "" || lastName == "" {
                                    empty = true
                                    return
                                }
                                
                                NewUser.fName = firstName
                                NewUser.lName = lastName
                                
                                continuePressed.toggle()
                            }
                    }
                    
                    
                }.padding()
                    .padding(.vertical, screenHeight/20)
                    .padding(.horizontal, 40)
                
            }
        }
    }
}

struct SUName_Previews: PreviewProvider {
    static var previews: some View {
        SUName()
    }
}
