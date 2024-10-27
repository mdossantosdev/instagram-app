//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by Marc on 22/09/2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel: CurrentUserProfileViewModel = .init()

    var body: some View {
        NavigationStack {
            ScrollView {
                if let currentUser = viewModel.currentUser {
                    ProfileHeaderView(user: currentUser)
                    PostGridView(user: currentUser)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                    }
                }
            }
            .refreshable {
                Task { try await viewModel.fetchCurrentUser() }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
