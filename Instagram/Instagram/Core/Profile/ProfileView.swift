//
//  ProfileView.swift
//  Instagram
//
//  Created by Marc on 18/09/2024.
//

import SwiftUI

struct ProfileView: View {

    let user: User

    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
    }

    var body: some View {
        ScrollView {
            ProfileHeaderView(user: user)

            PostGridView(posts: posts)
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[2])
}
