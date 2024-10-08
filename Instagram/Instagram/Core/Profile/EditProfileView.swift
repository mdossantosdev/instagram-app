//
//  EditProfileView.swift
//  Instagram
//
//  Created by Marc on 08/10/2024.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss

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
        }
    }
}

#Preview {
    EditProfileView()
}
