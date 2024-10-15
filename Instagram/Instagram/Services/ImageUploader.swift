//
//  ImageUploader.swift
//  Instagram
//
//  Created by Marc on 10/10/2024.
//

import FirebaseStorage
import SwiftUI

class ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")

        do {
            _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()

            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
            return nil
        }
    }
}
