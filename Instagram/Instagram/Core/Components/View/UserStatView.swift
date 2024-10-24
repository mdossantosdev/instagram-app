//
//  UserStatView.swift
//  Instagram
//
//  Created by Marc on 19/09/2024.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String

    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)

            Text(title)
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

#Preview {
    UserStatView(value: 300, title: "Followers")
}
