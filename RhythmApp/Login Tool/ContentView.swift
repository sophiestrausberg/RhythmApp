//
//  ContentView.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/28/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        Group {
        if authModel.user != nil {
            HomePage()
        } else {
            Login()
        }
        }.onAppear {
        authModel.listenToAuthState()
        }
        .environmentObject(AuthViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
