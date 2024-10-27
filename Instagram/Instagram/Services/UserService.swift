//
//  UserService.swift
//  Instagram
//
//  Created by Marc on 26/09/2024.
//

import Firebase
import FirebaseAuth
import Foundation

class UserService {
    @Published var currentUser: User?

    static let shared = UserService()

    private var usersCollection = Firestore.firestore().collection("users")

    init() {
        Task { try await fetchCurrentUser() }
    }

    func fetchUsers() async throws -> [User] {
        let snapshot = try await usersCollection.getDocuments()
        let documents = snapshot.documents

        return documents.compactMap({ try? $0.data(as: User.self) })
    }

    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await usersCollection.document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }

    func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await usersCollection.document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
}
