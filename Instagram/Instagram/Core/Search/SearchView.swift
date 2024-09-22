//
//  SearchView.swift
//  Instagram
//
//  Created by Marc on 21/09/2024.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(User.MOCK_USERS) { user in
                        NavigationLink(value: user) {
                            HStack {
                                AsyncImage(url: URL(string: user.profileImageUrl ?? "")) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                } placeholder: {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 28))
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(.black, lineWidth: 1)
                                        )
                                }

                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)

                                    Text(user.fullname ?? "")
                                }
                                .font(.footnote)

                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .foregroundStyle(.black)
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView()
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
