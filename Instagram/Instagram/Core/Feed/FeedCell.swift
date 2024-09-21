//
//  FeedCell.swift
//  Instagram
//
//  Created by Marc on 21/09/2024.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                Text("John Doe")
                    .font(.footnote)
                    .fontWeight(.semibold)

                Spacer()
            }
            .padding(.leading, 8)
        }
    }
}

#Preview {
    FeedCell()
}
