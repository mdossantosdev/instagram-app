//
//  PostService.swift
//  Instagram
//
//  Created by Marc on 20/10/2024.
//

import Firebase

class PostService {
    private static let postsCollection = Firestore.firestore().collection("posts")

    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postsCollection
            .order(by: "timestamp", descending: true)
            .getDocuments()

        var posts = try snapshot.documents.compactMap { try $0.data(as: Post.self) }

        for index in 0 ..< posts.count {
            let post = posts[index]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.shared.fetchUser(withUid: ownerUid)
            posts[index].user = postUser
        }
        return posts
    }

    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postsCollection
            .whereField("ownerUid", isEqualTo: uid)
            .order(by: "timestamp", descending: true)
            .getDocuments()

        return try snapshot.documents.compactMap { try $0.data(as: Post.self) }
    }
}
