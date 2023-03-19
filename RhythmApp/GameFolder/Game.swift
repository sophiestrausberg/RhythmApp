//
//  Game.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/12/23.
//

import SwiftUI
import AVKit

struct Game: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var timingOfTaps = [Double]()
    @State var timesTapped = 0
    @State var startTimer = true //function or variable? - start when the first tap occurs

    @StateObject var GameCont = GameController(5.0)
    
    var body: some View {
        ZStack {
            Circle().frame(width: 10000).edgesIgnoringSafeArea(.all).foregroundColor(Color("BrandRed"))
            Circle().frame(width: 900).edgesIgnoringSafeArea(.all).foregroundColor(Color("BrandLightRed"))
            Circle().frame(width: 600).edgesIgnoringSafeArea(.all).foregroundColor(Color("BrandRed"))
            
            VStack {
                HStack(spacing: 40) {
                    
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.screenWidth - 200, height: 100)
                            .cornerRadius(50)
                            .foregroundColor(Color("BrandDarkRed"))
                        
                        Rectangle()
                            .frame(width: UIScreen.screenWidth - 220, height: 80)
                            .cornerRadius(50)
                            .foregroundColor(Color("BrandYellow"))
                            .shadow(radius: 5)
                    }
                    
                    //make button
                    Button {
                        GameCont.runGame()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 80, height: 80)
                                .cornerRadius(30)
                                .foregroundColor(Color("BrandNeonOrange"))
    //                            .shadow(radius: 5, x: 5, y: 5)

                            Image(systemName: "pause.fill").font(.system(size: 40))
                                .foregroundColor(Color.white)
                        }
                    }
                    
                }.padding()
                
                
                
                Spacer()
                
                //width, height hardcoded. try different sizes. maybe a drum without drumsticks.
                Button {
                    GameCont.buttonTapped() //get from timer
//                    timesTapped += 1
//                    drumVibrate() //animation
//                    }

                } label: {
                    Image("Drum").resizable().frame(width: 450, height: 500)
                }
                
                Spacer()
                Spacer()
                
                //fix spacing
                if GameCont.correct == true {
                    //Show check or something
                }
                    
                if GameCont.correct == false {
                    //Show “x” or something
                }

                
            }

        }.background(Color("BrandLightRed"))
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}

