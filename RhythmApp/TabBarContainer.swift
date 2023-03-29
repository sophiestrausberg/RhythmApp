//
//  TabBarContainer.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/22/23.
//

import SwiftUI

struct TabBarContainer: View {
    @State var selectedTab = ""
    
    var body: some View {
        VStack {
            if selectedTab == "line.horizontal.3" {
                Feedback()
            } else if selectedTab == "app.badge" {
                ChoseAvatar() //change to home icon?
            } else {
                //Homescreen()
                HomePage()
            }
            
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
    
}

struct TabBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        TabBarContainer()
    }
}
