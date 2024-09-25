//
//  AuthService.swift
//  Instagram
//
//  Created by Marc on 23/09/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    @Published var userSession: FirebaseAuth.User?

    static let shared = AuthService()

    init() {
        self.userSession = Auth.auth().currentUser
    }

    @MainActor
    func createUser(email: String, username: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user

            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }

    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }

    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }

    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }

        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)

    }
}
