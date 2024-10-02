//
//  UserService.swift
//  Instagram
//
//  Created by Marc on 26/09/2024.
//

import Foundation
import Firebase

class UserService {

    func fetchUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
        for doc in documents {
            print(doc.data())
        }
        return []
    }
}
