//
//  SplashView.swift
//  Instagram
//
//  Created by Marc on 21/10/2024.
//

import SwiftUI

struct SplashView: View {
    @Binding var isPresented: Bool
    @State var activeIndex = 0
    let text = "Instagram"

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            VStack {
                Image(.instagramLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size.width / 3)
                    .padding(.bottom, 16)

                HStack(spacing: 0) {
                    ForEach(0..<text.count, id: \.self) { index in
                        Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundStyle(shouldScale(index) ? .purple : .gray.opacity(0.3))
                            .scaleEffect(shouldScale(index) ? 1.4 : 1.0)
                            .animation(.easeInOut(duration: 1), value: activeIndex)
                    }
                }
                .onAppear {
                    startAnimationLogo()

                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                        withAnimation(.easeIn(duration: 0.2)) {
                            self.isPresented.toggle()
                        }
                    }
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }

    private func shouldScale(_ index: Int) -> Bool {
        let groupStartIndex = (activeIndex / 5) * 5
        let groupEndIndex = groupStartIndex + (activeIndex % 5)
        return index >= groupStartIndex && index <= groupEndIndex
    }

    private func startAnimationLogo() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            withAnimation {
                if activeIndex + 1 >= text.count {
                    activeIndex = 0
                } else {
                    activeIndex += 1
                }
            }
        }
    }
}

#Preview {
    SplashView(isPresented: .constant(true))
}
