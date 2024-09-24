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
    
    func createUser(email: String, username: String, password: String) async throws {
        print("Email: \(email)")
        print("Username: \(username)")
        print("Password: \(password)")
    }
}
