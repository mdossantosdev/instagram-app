//
//  Post.swift
//  Instagram
//
//  Created by Marc on 22/09/2024.
//

import Foundation

struct Post: Codable, Identifiable, Hashable {
    let id: String
    let ownerUid: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Date
    let user: User?
}

extension Post {
    // swiftlint:disable:next identifier_name
    static let MOCK_POSTS: [Post] = [
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "This is some test caption for now",
              likes: 777,
              imageUrl: "",
              timestamp: Date(),
              user: User.MOCK_USERS[1]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "This is some test caption for now",
              likes: 42,
              imageUrl: "",
              timestamp: Date(),
              user: User.MOCK_USERS[3]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "This is some test caption for now",
              likes: 888,
              imageUrl: "",
              timestamp: Date(),
              user: User.MOCK_USERS[0]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "This is some test caption for now",
              likes: 141,
              imageUrl: "",
              timestamp: Date(),
              user: User.MOCK_USERS[2]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "This is some test caption for now",
              likes: 473,
              imageUrl: "",
              timestamp: Date(),
              user: User.MOCK_USERS[4])
    ]
}
