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
            .padding()

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
                    
                    Text("Profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.vertical, 8)
            
            Divider()
        }
    }
}

#Preview {
    EditProfileView()
}
