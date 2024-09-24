//
//  ContentViewModel.swift
//  Instagram
//
//  Created by Marc on 23/09/2024.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {

    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()

    @Published var userSession: FirebaseAuth.User?

    init() {
        setupSubscriber()
    }

    func setupSubscriber() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
