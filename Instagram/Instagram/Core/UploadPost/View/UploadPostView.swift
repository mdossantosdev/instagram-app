//
//  UploadPostView.swift
//  Instagram
//
//  Created by Marc on 22/09/2024.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @Binding var tab: Tab
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()

    var body: some View {
        VStack {
            HStack {
                Button {
                    clearPostDataAndReturnToFeed()
                } label: {
                    Text("Cancel")
                }

                Spacer()

                Text("New Post")
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    Task {
                        try await viewModel.uploadPost(caption: caption)
                        clearPostDataAndReturnToFeed()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)

            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }

                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()

            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }

    private func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tab = .feed
    }
}

#Preview {
    UploadPostView(tab: .constant(.feed))
}
