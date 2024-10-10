//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Marc on 09/10/2024.
//

import Firebase
import PhotosUI
import SwiftUI

class EditProfileViewModel: ObservableObject {
    @Published var user: User

    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(from: selectedImage) } }
    }
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""

    init(user: User) {
        self.user = user
    }

    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }

        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }

        self.profileImage = Image(uiImage: uiImage)
    }

    func updateUserData() async throws {
        var data = [String: Any]()

        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }

        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }

        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
