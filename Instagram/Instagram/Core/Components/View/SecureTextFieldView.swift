//
//  SecureTextFieldView.swift
//  Instagram
//
//  Created by Marc on 21/10/2024.
//

import SwiftUI

struct SecureTextFieldView: View {
    @Binding var text: String
    @State var showPassword: Bool = false
    let placeholder: String
    var isSecureField: Bool = true

    var body: some View {
        VStack {
            if isSecureField {
                HStack {
                    if !showPassword {
                        SecureField(placeholder, text: $text)
                            .modifier(IGTextFieldModifier())
                    } else {
                        TextField(placeholder, text: $text)
                            .modifier(IGTextFieldModifier())
                    }
                }
                .overlay(alignment: .trailing) {
                    Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                        .padding(20)
                        .offset(x: -10)
                        .onTapGesture { showPassword.toggle() }
                }
            } else {
                TextField(placeholder, text: $text)
                    .modifier(IGTextFieldModifier())
            }
        }
    }
}

#Preview {
    SecureTextFieldView(text: .constant(""), placeholder: "Enter your password")
}
