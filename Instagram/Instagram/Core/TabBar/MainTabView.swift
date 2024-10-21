//
//  MainTabView.swift
//  Instagram
//
//  Created by Marc on 18/09/2024.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @State private var selectedTab: Tab = .feed

    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: Tab.feed.rawValue)
                }.tag(Tab.feed)

            SearchView()
                .tabItem {
                    Image(systemName: Tab.search.rawValue)
                }.tag(Tab.search)

            UploadPostView(tab: $selectedTab)
                .tabItem {
                    Image(systemName: Tab.upload.rawValue)
                }.tag(Tab.upload)

            Text("Favorite")
                .tabItem {
                    Image(systemName: Tab.favorite.rawValue)
                }.tag(Tab.favorite)

            CurrentUserProfileView(user: user)
                .tabItem {
                    Image(systemName: Tab.profile.rawValue)
                }.tag(Tab.profile)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView(user: User.MOCK_USERS[0])
}
