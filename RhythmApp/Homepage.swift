//
//  Homepage.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/12/23.
//

import SwiftUI

struct HomePage: View {
    @State var selectedTab = "line.horizontal.3"
    
    var body: some View {
        VStack() {
            Spacer()
            Circle()
                .frame(width: 200)
                .padding()
                .overlay( Circle().stroke(Color.yellow, lineWidth: 6).frame(width: 200))

            Text("Welcome back")
                .font(.custom("Quicksand-SemiBold", size: 40))
            Text("Dazy")
                .font(.custom("Quicksand-Bold", size: 70))
                .foregroundColor(Color("BrandOrange"))
               
            
            Spacer()
            
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea()
    }//ADD BACKGROUND COLOR?
    

}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

