//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Marc on 22/09/2024.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
class UploadPostViewModel: ObservableObject {

    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task {
            await loadImage(from: selectedImage)
        }}
    }
    @Published var postImage: Image?

    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }

        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }

        self.postImage = Image(uiImage: uiImage)
    }
}
