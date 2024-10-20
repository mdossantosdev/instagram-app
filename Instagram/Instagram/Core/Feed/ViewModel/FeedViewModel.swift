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

    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
}
