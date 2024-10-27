//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by Marc on 22/09/2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel: CurrentUserProfileViewModel = .init()

    private var currentUser: User? {
        return viewModel.currentUser
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileHeaderView(user: currentUser!)
                PostGridView(user: currentUser!)
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
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
