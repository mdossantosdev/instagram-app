//
//  PostGridViewModel.swift
//  Instagram
//
//  Created by Marc on 21/10/2024.
//

import Foundation

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    private let user: User
    
    init(user: User) {
        self.user = user
        
        Task { try await fetchUserPosts() }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        self.posts = try await PostService.fetchUserPosts(uid: user.id)
        
        for index in 0 ..< posts.count {
            posts[index].user = self.user
        }
    }
}
