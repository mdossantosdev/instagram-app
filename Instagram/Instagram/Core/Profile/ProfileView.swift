//
//  ProfileView.swift
//  Instagram
//
//  Created by Marc on 18/09/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack {
                HStack {}

                VStack {}

                Button {

                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .foregroundStyle(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }

                Divider()
            }
        }
    }
}

#Preview {
    ProfileView()
}
