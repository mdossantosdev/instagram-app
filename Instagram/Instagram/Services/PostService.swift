//
//  PostService.swift
//  Instagram
//
//  Created by Marc on 20/10/2024.
//

import Firebase

class PostService {
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })

        for index in 0 ..< posts.count {
            let post = posts[index]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[index].user = postUser
        }
        return posts
    }
}
