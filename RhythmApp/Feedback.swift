//
//  Feedback.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/12/23.
//

import SwiftUI

struct Feedback: View {
    @State var speechRecognizer1 = false
    @State var speechRecognizer2 = false
    @State var speechRecognizer3 = false
    
    var body: some View {
        VStack(alignment: .leading) {
//           Spacer()
            
            Text("Time spent this week") .font(.custom("Quicksand-SemiBold", size: 40))
                .padding(.top, 100)
            Text("15 minutes")
                .font(.custom("Quicksand-Bold", size: 50))
                .foregroundColor(Color("BrandBlue"))
                .padding(.bottom, 50)
            
            Text("Daily Streak") .font(.custom("Quicksand-SemiBold", size: 40))
            Text("8 Days")
                .font(.custom("Quicksand-Bold", size: 50))
                .foregroundColor(Color("BrandPeach"))
                .padding(.bottom, 50)
   
            
            ZStack {
                Rectangle()
                    .frame(width: 700, height: 100)
                //.edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color.black.opacity(0.05))
//                    .cornerRadius(25)
                HStack(spacing: 350) {
                    Text("Game History")
                        .font(.custom("Quicksand-SemiBold", size: 40))
                    
                    Image(systemName: "chevron.down").font(.system(size: 30)).bold()
                }
            }
            .padding(.bottom, 50)
        
            Text("Still Learning") .font(.custom("Quicksand-SemiBold", size: 40))
            
            HStack(spacing: 130) {
                
                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)){self.speechRecognizer1.toggle()}// button animation
                    
                } label: {
                    Image(systemName: "waveform")// Button Image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(speechRecognizer1 ? Circle().foregroundColor(.red).frame(width: 128, height: 128) : Circle().foregroundColor(Color("BrandGreen")).frame(width: 105, height: 105))
                }
                
                
                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)){self.speechRecognizer2.toggle()}// button animation
                    
                } label: {
                    Image(systemName: "waveform")// Button Image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(speechRecognizer2 ? Circle().foregroundColor(.red).frame(width: 128, height: 128) : Circle().foregroundColor(Color("BrandGreen")).frame(width: 105, height: 105))
                }
                
                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)){self.speechRecognizer3.toggle()}// button animation
                    
                } label: {
                    Image(systemName: "waveform")// Button Image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(speechRecognizer3 ? Circle().foregroundColor(.red).frame(width: 128, height: 128) : Circle().foregroundColor(Color("BrandGreen")).frame(width: 105, height: 105))
                }
                
            }.padding(.top, 30)
                .offset(x: 35)
            
            Spacer()
        }
    }
}

struct Feedback_Previews: PreviewProvider {
    static var previews: some View {
        Feedback()
    }
}
