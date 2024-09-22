//
//  UploadPostView.swift
//  Instagram
//
//  Created by Marc on 22/09/2024.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {

    @State private var caption = ""
    @State private var imagePickerPresented = false
    @State private var photoItem: PhotosPickerItem?

    var body: some View {
        VStack {
            HStack {
                Button {
                    print("Cancel Upload")
                } label: {
                    Text("Cancel")
                }

                Spacer()

                Text("New Post")
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    print("Upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)

            HStack(spacing: 8) {
                Image(systemName: "camera")
                    .resizable()
                    .frame(width: 100, height: 100)

                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()

            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $photoItem)
    }
}

#Preview {
    UploadPostView()
}
