//
//  CurrentUserProfileViewModel.swift
//  Instagram
//
//  Created by Marc on 27/10/2024.
//

import Combine
import Foundation

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscribers()
    }

    func fetchCurrentUser() async throws {
        try await UserService.shared.fetchCurrentUser()
    }

    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
