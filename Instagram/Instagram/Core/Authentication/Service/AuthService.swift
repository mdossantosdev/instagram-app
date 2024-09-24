//
//  AuthService.swift
//  Instagram
//
//  Created by Marc on 23/09/2024.
//

import Foundation
import FirebaseAuth

class AuthService {

    @Published var userSession: FirebaseAuth.User?

    static let shared = AuthService()

    init() {
        self.userSession = Auth.auth().currentUser
    }
}
