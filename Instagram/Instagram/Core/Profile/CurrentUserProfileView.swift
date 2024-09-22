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
                VStack(spacing: 10) {
                    HStack {
                        AsyncImage(url: URL(string: user.profileImageUrl ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 36))
                                .frame(width: 80, height: 80)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(.black, lineWidth: 1)
                                )
                        }

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
                                .font(.subheadline)
                        }

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                    Button {

                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .foregroundStyle(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }

                    Divider()
                }

                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {

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
