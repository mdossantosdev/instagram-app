//
//  MainTabView.swift
//  Instagram
//
//  Created by Marc on 18/09/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }

            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }

            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square.fill")
                }

            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
