//
//  UserService.swift
//  Instagram
//
//  Created by Marc on 26/09/2024.
//

import Foundation
import Firebase

class UserService {

    static func fetchUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents

        return documents.compactMap({ try? $0.data(as: User.self) })
    }
}
