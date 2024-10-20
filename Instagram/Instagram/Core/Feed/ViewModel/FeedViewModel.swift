//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Marc on 20/10/2024.
//

import Firebase
import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()

    init() {
        Task { try await fetchPosts() }
    }

    @MainActor
    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })

        for index in 0 ..< posts.count {
            let post = posts[index]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            self.posts[index].user = postUser
        }
    }
}
