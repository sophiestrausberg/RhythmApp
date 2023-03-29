//
//  CongratsMessage.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/25/23.
//

import SwiftUI

struct CongratsMessage: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Excellent!")
                .font(.custom("Quicksand-Bold", size: 80))
                .foregroundColor(Color("BrandOrange"))
           
            Text("You got a perfect score!")
                .font(.custom("Quicksand-Semibold", size: 20))
            
            Spacer()
            
            Image("Badge")
            
            Spacer()
            
            ScrollView{
                    
                    GeometryReader { geometry in
                        Card(image: "music.mic", text: "Played 7 new songs", minY: geometry.frame(in: .global).minY)
                    }
                 //   .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    
                    GeometryReader { geometry in
                        Card(image: "timer", text: "Played for over 10 minutes", minY: geometry.frame(in: .global).minY)
                    }
                 //   .frame(maxWidth: .infinity)
                    .frame(height: 100)
                
                GeometryReader { geometry in
                    Card(image: "flame", text: "9 Day streak", minY: geometry.frame(in: .global).minY)
                }
             //   .frame(maxWidth: .infinity)
                .frame(height: 100)
               
            }.frame(height: 200)
            
            HStack(alignment: .center, spacing: 3) {
                Text("Return home")
                    .font(.custom("Quicksand-Bold", size: 20))
                
               // Image(systemName: "arrow.forward")
                    .bold()
            }.padding(.top, 10)
                .padding(.bottom, 40)
            .foregroundColor(Color("BrandOrange"))
        }
    }
}

struct Card: View {
    var image: String
    var text: String
    var minY: CGFloat

    //add some shadows
    var body: some View {
        ZStack() {
            
            HStack {
                Spacer()
                Rectangle()
                    .frame(width: 700, height: 100)
                //.edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color.black.opacity(0.05))
                    .cornerRadius(25)
                    //.shadow(radius: 5)
                Spacer()
                
            }
            
            HStack(spacing: 15) {
                Image(systemName: image).font(.system(size: 30))
                Text(text)
                    .font(.custom("Quicksand-SemiBold", size: 25))
            }
            
        }
        .scaleEffect(minY<870 ? minY / 500 - 1 : 1)//changed from 1000
       // .rotation3DEffect(Angle(degrees: Double(minY / 100)), axis: (x: 10, y: 0, z: 0))
    }
}

struct CongratsMessage_Previews: PreviewProvider {
    static var previews: some View {
        CongratsMessage()
    }
}
