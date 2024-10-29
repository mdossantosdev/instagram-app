//
//  SettingsView.swift
//  Instagram
//
//  Created by Marc on 29/10/2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var isDeleteAccountDialogVisible = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Account")
                    .font(.subheadline)
                    .foregroundStyle(Color(.systemGray))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)

                VStack(spacing: 0) {
                    NavigationLink {
                        EmptyView()
                    } label: {
                        RowSettingsView(label: "Change email", isLink: true)
                    }

                    Divider()

                    NavigationLink {
                        EmptyView()
                    } label: {
                        RowSettingsView(label: "Change password", isLink: true)
                    }
                }
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 16)

                Spacer()

                Text("Member since 25 October 2024")
                    .font(.caption)
                    .foregroundStyle(Color(.systemGray))

                VStack(spacing: 0) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        RowSettingsView(label: "Logout")
                            .foregroundStyle(Color(.systemRed))
                    }

                    Divider()

                    Button {
                        isDeleteAccountDialogVisible = true
                    } label: {
                        RowSettingsView(label: "Delete Account")
                            .foregroundStyle(Color(.systemRed))
                    }
                    .confirmationDialog(
                        Text("Delete Account?"),
                        isPresented: $isDeleteAccountDialogVisible
                    ) {
                        Button("Confirm Delete", role: .destructive) {}
                    } message: {
                        Text("Are you sure you want to delete your account? This action cannot be undone.")
                    }
                }
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 16)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(.ultraThinMaterial)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RowSettingsView: View {
    let label: String
    var isLink: Bool?

    var body: some View {
        HStack(spacing: 10) {
            Text(label)
                .font(.subheadline)
                .foregroundStyle(.primary)

            Spacer()

            if isLink ?? false {
                Image(systemName: "chevron.right")
            }
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
