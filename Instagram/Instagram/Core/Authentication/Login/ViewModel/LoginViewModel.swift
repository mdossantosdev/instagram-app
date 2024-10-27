//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Marc on 25/09/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
