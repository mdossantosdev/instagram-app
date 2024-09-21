//
//  AddEmailView.swift
//  Instagram
//
//  Created by Marc on 21/09/2024.
//

import SwiftUI

struct AddEmailView: View {
    @State private var email = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 12) {
            Text("Add Your Email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundStyle(Color(.systemGray2))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 20)
                .padding(.top)

            Button {
                print("Next")
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.vertical)

            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    AddEmailView()
}
