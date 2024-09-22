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
              imageUrl: "https://images.pexels.com/photos/3018992/pexels-photo-3018992.jpeg",
              timestamp: Date(),
              user: User.MOCK_USERS[2]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "This is some test caption for now",
              likes: 42,
              imageUrl: "https://images.pexels.com/photos/19597723/pexels-photo-19597723/free-photo-of-route-campagne-voiture-vehicule.jpeg",
              timestamp: Date(),
              user: User.MOCK_USERS[2]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "This is some test caption for now",
              likes: 888,
              imageUrl: "https://images.pexels.com/photos/3568521/pexels-photo-3568521.jpeg",
              timestamp: Date(),
              user: User.MOCK_USERS[0]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "This is some test caption for now",
              likes: 141,
              imageUrl: "https://images.pexels.com/photos/28200237/pexels-photo-28200237/free-photo-of-voitures.jpeg",
              timestamp: Date(),
              user: User.MOCK_USERS[2]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "This is some test caption for now",
              likes: 473,
              imageUrl: "https://images.pexels.com/photos/4994815/pexels-photo-4994815.jpeg",
              timestamp: Date(),
              user: User.MOCK_USERS[2])
    ]
}
