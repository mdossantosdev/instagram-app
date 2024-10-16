//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by Marc on 22/09/2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User

    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileHeaderView(user: user)

                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[2])
}
