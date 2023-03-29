//
//  ChoseAvatar.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/28/23.
//

import SwiftUI

struct ChoseAvatar: View {
    var body: some View {
        VStack {
            Spacer()
            Text("My Character")
                .font(.custom("Quicksand-Bold", size: 70))
            Spacer()
            
            VStack(spacing: 30) {
                
                HStack {
                    Circle()
                        .frame(width: 200)
                        .padding()
                        .overlay( Circle().stroke(Color.yellow, lineWidth: 6).frame(width: 200))
                    
                    Circle()
                        .frame(width: 200)
                        .padding()
                        .overlay( Circle().stroke(Color.orange, lineWidth: 6).frame(width: 200))
                    
                    Circle()
                        .frame(width: 200)
                        .padding()
                        .overlay( Circle().stroke(Color.green, lineWidth: 6).frame(width: 200))
                }
                
                HStack {
                    Circle()
                        .frame(width: 200)
                        .padding()
                        .overlay( Circle().stroke(Color.mint, lineWidth: 6).frame(width: 200))
                    
                    Circle()
                        .frame(width: 200)
                        .padding()
                        .overlay( Circle().stroke(Color("BrandPink"), lineWidth: 6).frame(width: 200))
                    
                    Circle()
                        .frame(width: 200)
                        .padding()
                        .overlay( Circle().stroke(Color("BrandLightRed"), lineWidth: 6).frame(width: 200))
                }
            }
            Spacer()
        }
    }
}

struct ChoseAvatar_Previews: PreviewProvider {
    static var previews: some View {
        ChoseAvatar()
    }
}
