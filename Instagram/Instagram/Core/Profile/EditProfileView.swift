//
//  EditProfileView.swift
//  Instagram
//
//  Created by Marc on 08/10/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedImage: PhotosPickerItem?
    @State private var fullname = ""
    @State private var bio = ""

    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }

                Spacer()

                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    //
                } label: {
                    Text("Done")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
            }
            .padding(.horizontal)

            Divider()

            PhotosPicker(selection: $selectedImage) {
                VStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .padding()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(Color.white)
                        .background(Color.gray)
                        .clipShape(Circle())

                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.vertical, 8)

            Divider()

            VStack {
                EditProfileRowView(title: "Name",
                                   placeholder: "Enter your name",
                                   text: $fullname)

                EditProfileRowView(title: "Bio",
                                   placeholder: "Enter your bio",
                                   text: $bio)
            }
            
            Spacer()
        }
    }
}

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)

            VStack {
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

#Preview {
    EditProfileView()
}
