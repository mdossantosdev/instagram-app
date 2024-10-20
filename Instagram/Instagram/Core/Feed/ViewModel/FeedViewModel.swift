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
        self.posts = try await PostService.fetchFeedPosts()
    }
}
