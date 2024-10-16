//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by Marc on 22/09/2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User

    @State private var showEditProfile = false

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                CircularProfileImageView(user: user)

                Spacer()

                HStack(spacing: 8) {
                    UserStatView(value: 3, title: "Posts")

                    UserStatView(value: 26, title: "Followers")

                    UserStatView(value: 34, title: "Following")
                }
            }
            .padding(.horizontal)

            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }

                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("Follow user...")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? Color(.systemBackground) : Color(.systemBlue))
                    .foregroundStyle(user.isCurrentUser ? .black : .white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }

            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[2])
}
