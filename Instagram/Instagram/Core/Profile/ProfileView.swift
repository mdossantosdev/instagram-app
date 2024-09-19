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
                HStack {
                    AsyncImage(url: URL(string: "https://i.pravatar.cc/300?img=12")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } placeholder: {
                        Image(systemName: "person.fill")
                            .font(.system(size: 36))
                            .frame(width: 80, height: 80)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(.black, lineWidth: 1)
                            )
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        VStack {
                            Text("3")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            Text("Posts")
                                .font(.footnote)
                        }
                        .frame(width: 76)
                        
                        VStack {
                            Text("3")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            Text("Followers")
                                .font(.footnote)
                        }
                        .frame(width: 76)
                        
                        VStack {
                            Text("3")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            Text("Following")
                                .font(.footnote)
                        
                        }
                        .frame(width: 76)
                    }
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 4) {
                    Text("John Doe")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    Text("New York")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

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
