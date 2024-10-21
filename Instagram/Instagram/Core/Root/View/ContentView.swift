//
//  ContentView.swift
//  Instagram
//
//  Created by Marc on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    @State private var isSplashPresented = true

    var body: some View {
        Group {
            if isSplashPresented {
                SplashView(isPresented: $isSplashPresented)
            } else if let currentUser = viewModel.currentUser {
                MainTabView(user: currentUser)
            } else {
                LoginView()
                    .environmentObject(registrationViewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
