//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by Marc on 22/09/2024.
//

import SwiftUI

struct ProfileHeaderView: View {

    let user: User

    var body: some View {
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
                        .font(.system(size: 40))
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
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

            Button {
                //
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
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[2])
}
