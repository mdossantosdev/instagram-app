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

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }

            UploadPostView()
                .tabItem {
                    Image(systemName: "plus.square.fill")
                }

            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }

            CurrentUserProfileView(user: User.MOCK_USERS[2])
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
