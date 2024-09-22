//
//  User.swift
//  Instagram
//
//  Created by Marc on 22/09/2024.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let username: String
    let email: String
    let profileImageUrl: String?
    let fullname: String?
    let bio: String?
}

extension User {
    // swiftlint:disable:next identifier_name
    static let MOCK_USERS: [User] = [
        .init(id: UUID().uuidString,
              username: "johndoe",
              email: "johndoe@protonmail.com",
              profileImageUrl: "https://i.pravatar.cc/200?img=12",
              fullname: "John Doe",
              bio: "React Native developer"),
        .init(id: UUID().uuidString,
              username: "samsmith",
              email: "samsmith@tuta.com",
              profileImageUrl: "https://i.pravatar.cc/200?img=8",
              fullname: "Sam Smith",
              bio: "UI/UX designer"),
        .init(id: UUID().uuidString,
              username: "jennacooper",
              email: "jennacooper@protonmail.com",
              profileImageUrl: "https://i.pravatar.cc/200?img=1",
              fullname: "Jenna Cooper",
              bio: "front-end developer passionate about UX"),
        .init(id: UUID().uuidString,
              username: "samcarter",
              email: "samcooper@fastmail.com",
              profileImageUrl: "",
              fullname: "Samuel Carter",
              bio: "iOS developer and blogger"),
        .init(id: UUID().uuidString,
              username: "emmalewis",
              email: "emlewis@securemail.com",
              profileImageUrl: "https://i.pravatar.cc/200?img=26",
              fullname: "Emma Lewis",
              bio: "Swift and SwiftUI enthusiast")
    ]
}
