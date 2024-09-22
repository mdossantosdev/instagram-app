//
//  ProfileView.swift
//  Instagram
//
//  Created by Marc on 18/09/2024.
//

import SwiftUI

struct ProfileView: View {

    let user: User

    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    var body: some View {
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
                            .font(.system(size: 54))
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
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
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

                Divider()
            }

            LazyVGrid(columns: gridItems, spacing: 2) {
                ForEach(0 ... 15, id: \.self) { _ in
                    AsyncImage(url: URL(string: "https://i.pravatar.cc/300?img=10")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Image(systemName: "person.fill")
                            .font(.system(size: 36))
                            .frame(width: 80, height: 80)
                    }
                }
            }
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
