//
//  TimerNew.swift
//  ExtraProject
//
//  Created by Alyssa Feinberg on 2/25/23.
//

import SwiftUI

struct SetTimer: View {
    @State private var hour = "00"
    @State private var minutes = "00"
    @State private var seconds = "00"
    
    var body: some View {
        NavigationStack {
            let background = Color(red: 150/255, green: 200/255, blue: 220/255)
            ZStack {
                background.ignoresSafeArea()
                
                VStack {
                    // clock image
                    Image("Clock")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .padding(.bottom, 30)
                        .ignoresSafeArea()
                    
                    HStack {
                        VStack {
                            Button(action: {
                                if Int(seconds)! < 9 {
                                    seconds = "0" + String(Int(seconds)! + 1)
                                }
                                else if Int(seconds)! < 59 {
                                    seconds = String(Int(seconds)! + 1)
                                }
                                else if Int(minutes)! < 59 {
                                    minutes = String(Int(minutes)! + 1)
                                    seconds = "00"
                                }
                                else {
                                    hour = String(Int(hour)! + 1)
                                    minutes = "00"
                                    seconds = "00"
                                }
                                
                            }){
                                Image("Triangle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action: {
                                if Int(seconds)! > 0 && Int(seconds)! < 11 {
                                    seconds = "0" + String(Int(seconds)! - 1)
                                }
                                
                                else if Int(seconds)! > 11 {
                                    seconds = String(Int(seconds)! - 1)
                                }
                                else if Int(seconds)! == 0 {
                                    if Int(minutes)! != 0 {
                                        seconds = "59"
                                        minutes = String(Int(minutes)! - 1)
                                    }
                                    else if Int(hour)! != 0 {
                                        hour = String(Int(hour)! - 1)
                                        minutes = "59"
                                        seconds = "59"
                                    }
                                }
                                else {
                                    hour = String(Int(hour)! - 1)
                                    minutes = "00"
                                }
                                
                            }) {
                                Image("Triangle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .scaleEffect(CGSize(width: 1.0, height: -1.0))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }.padding(.trailing, 10)
                        //hour textfield
                        TextField("", text: $hour)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 70, weight: .bold, design: .rounded))
                            .padding()
                            .frame(width: 125)
                            .background(.thinMaterial)
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 4))
                        Text(":")
                            .font(.system(size: 70, weight: .bold, design: .rounded))
                        
                        //minutes textfield
                        TextField("", text: $minutes)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 70, weight: .bold, design: .rounded))
                            .padding()
                            .frame(width: 125)
                            .background(.thinMaterial)
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 4))
                        
                        Text(":")
                            .font(.system(size: 70, weight: .bold, design: .rounded))
                        
                        //seconds textfield
                        VStack {
                            TextField("", text: $seconds)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 70, weight: .bold, design: .rounded))
                                .padding()
                                .frame(width: 125)
                                .background(.thinMaterial)
                                .cornerRadius(20)
                                .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 4))
                            
                            //   Stepper("", value: $hours, in: 0...60, step: 1)
                            //      .labelsHidden()
                        }
                        
                        
                    }
                    HStack {
                        Button("Save", action: {
                            // self.finalTime = Int(seconds)! + Int(minutes)! * 60 + Int(hour)
                        })
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 150)
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 2))
                        .foregroundColor(Color.black)
                        .background(Color(red: 220/255, green: 236/255, blue: 242/255))
                        
                        Button("Reset", action: {
                            self.hour = "00"
                            self.minutes = "00"
                            self.seconds = "00"
                        })
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 150)
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 2))
                        .foregroundColor(Color.black)
                        .background(Color(red: 220/255, green: 236/255, blue: 242/255))
                    }
                    
                    NavigationLink(destination: Game(timeRemaining: getSeconds(seconds, minutes, hour)), label: {Text("Start")})
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 300, height: 50)
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 2))
                        .foregroundColor(Color.white)
                        .background(Color(red: 52/255, green: 131/255, blue: 235/255))
                        .padding(.top, 20)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    func getSeconds(_ seconds: String, _ minutes: String, _ hour: String) -> Int {
        return (Int(seconds)! + Int(minutes)!*60 + Int(hour)!*3600)
    }
}

struct SetTimer_Previews: PreviewProvider {
    static var previews: some View {
        SetTimer()
    }
}
