//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by Marc on 24/09/2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""

    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, username: username, password: password)
    }
}
