//
//  UserService.swift
//  Instagram
//
//  Created by Marc on 26/09/2024.
//

import Firebase
import Foundation

class UserService {

    static let shared = UserService()

    private var usersCollection = Firestore.firestore().collection("users")

    func fetchUsers() async throws -> [User] {
        let snapshot = try await usersCollection.getDocuments()
        let documents = snapshot.documents

        return documents.compactMap({ try? $0.data(as: User.self) })
    }

    func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await usersCollection.document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
}
