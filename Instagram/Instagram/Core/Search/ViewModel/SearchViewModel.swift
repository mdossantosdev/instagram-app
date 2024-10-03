//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Marc on 02/10/2024.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users: [User] = []

    init() {
        Task { try await fetchUsers() }
    }

    @MainActor
    func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
