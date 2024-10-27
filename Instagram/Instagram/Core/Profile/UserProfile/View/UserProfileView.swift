//
//  UserProfileView.swift
//  Instagram
//
//  Created by Marc on 27/10/2024.
//

import SwiftUI

struct UserProfileView: View {
    let user: User

    var body: some View {
        ScrollView {
            ProfileHeaderView(user: user)

            PostGridView(user: user)
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserProfileView(user: User.MOCK_USERS[2])
}
