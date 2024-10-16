//
//  SearchView.swift
//  Instagram
//
//  Created by Marc on 21/09/2024.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @StateObject var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                CircularProfileImageView(user: user, size: .xSmall)

                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)

                                    Text(user.fullname ?? "")
                                }
                                .font(.footnote)

                                Spacer()
                            }
                            .padding(.horizontal)
                            .foregroundStyle(.black)
                        }
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
