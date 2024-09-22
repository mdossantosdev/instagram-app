//
//  PostGridView.swift
//  Instagram
//
//  Created by Marc on 22/09/2024.
//

import SwiftUI

struct PostGridView: View {

    let posts: [Post]

    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    var body: some View {
        GeometryReader { geometry in
            LazyVGrid(columns: gridItems, spacing: 2) {
                ForEach(posts) { post in
                    AsyncImage(url: URL(string: post.imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width / 3 - 1,
                                   height: geometry.size.width / 3 - 1)
                            .clipped()
                    } placeholder: {
                        Image(systemName: "camera")
                            .font(.system(size: 36))
                            .foregroundStyle(Color(.white))
                            .frame(width: geometry.size.width / 3 - 1,
                                   height: geometry.size.width / 3 - 1)
                            .background(Color(.systemGray4))
                    }
                }
            }
        }
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POSTS)
}