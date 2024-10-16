//
//  CircularProfileImageView.swift
//  Instagram
//
//  Created by Marc on 16/10/2024.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    let user: User

    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.fill")
                .font(.system(size: 40))
                .scaledToFit()
                .frame(width: 80, height: 80)
                .background(Color(.systemGray6))
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.MOCK_USERS[0])
}
