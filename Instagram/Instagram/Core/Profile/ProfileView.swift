//
//  ProfileView.swift
//  Instagram
//
//  Created by Marc on 18/09/2024.
//

import SwiftUI

struct ProfileView: View {

    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                HStack {
                    AsyncImage(url: URL(string: "https://i.pravatar.cc/300?img=12")) { image in
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
                    Text("John Doe")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    Text("New York")
                        .font(.subheadline)
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
    }
}

#Preview {
    ProfileView()
}
