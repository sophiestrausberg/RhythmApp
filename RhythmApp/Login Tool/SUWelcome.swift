//
//  SUWelcome.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/28/23.
//

import SwiftUI
import ConfettiSwiftUI
import FirebaseAuth


struct SUWelcome: View {
    @EnvironmentObject private var authModel: AuthViewModel
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    @State private var counter: Int = 0
    @State var continuePressed = false
    
    var body: some View {
        ZStack {
            Color("BrandLightGreen").opacity(0.35).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack(spacing: 8) {
                    Text("Welcome, \(NewUser.fName!)!")
                        .bold()
                        .font(.title)
                    Text("CommunAphasia is so happy to have you.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }.padding(.bottom, screenHeight/20)
                
                NavigationLink(destination: HomePage().environmentObject(AuthViewModel()).navigationBarBackButtonHidden(true), isActive: $continuePressed) {
                    Text("LET'S GO")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color("BrandGreen")).cornerRadius(8)
                        .shadow(radius: 5)
                        .onTapGesture {
                            continuePressed.toggle()
                        }
                }
                
            }.confettiCannon(counter: $counter)
                .onAppear {
                    counter += 1
                }
            
        }.navigationBarHidden(true)
    }
}

struct SUWelcome_Previews: PreviewProvider {
    static var previews: some View {
        SUWelcome()
    }
}
