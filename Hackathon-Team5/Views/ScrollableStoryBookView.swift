//
//  ScrollableStoryBookView.swift
//  Hackathon-Team5
//
//  Created by Fernanda Carvalho on 04/06/24.
//

import SwiftUI

struct ScrollableStoryBookView: View {
    @State private var fontSize: CGFloat = 14
    private let minFontSize: CGFloat = 10
    private let maxFontSize: CGFloat = 24

    var body: some View {
        VStack {
            ScrollView {
                Text("Era uma manhã ensolarada, e a pequena Lúcia estava radiante com seu vestido vermelho e caminhando animadamente para a escola. O sol brilhava forte, prometendo um dia cheio de aventuras e alegrias com os novos amigos que ela faria. Era uma manhã ensolarada, e a pequena Lúcia estava radiante com seu vestido vermelho e caminhando animadamente para a escola. O sol brilhava forte, prometendo um dia cheio de aventuras e alegrias com os novos amigos que ela faria. Era uma manhã ensolarada, e a pequena Lúcia estava radiante com seu vestido vermelho e caminhando animadamente para a escola. O sol brilhava forte, prometendo um dia cheio de aventuras e alegrias com os novos amigos que ela faria. Era uma manhã ensolarada, e a pequena Lúcia estava radiante com seu vestido vermelho e caminhando animadamente para a escola. O sol brilhava forte, prometendo um dia cheio de aventuras e alegrias com os novos amigos que ela faria. Era uma manhã ensolarada, e a pequena Lúcia estava radiante com seu vestido vermelho e caminhando animadamente para a escola. O sol brilhava forte, prometendo um dia cheio de aventuras e alegrias com os novos amigos que ela faria. Era uma manhã ensolarada, e a pequena Lúcia estava radiante com seu vestido vermelho e caminhando animadamente para a escola. O sol brilhava forte, prometendo um dia cheio de aventuras e alegrias com os novos amigos que ela faria. Era uma manhã ensolarada, e a pequena Lúcia estava radiante com seu vestido vermelho e caminhando animadamente para a escola. O sol brilhava forte, prometendo um dia cheio de aventuras e alegrias com os novos amigos que ela faria. Era uma manhã ensolarada, e a pequena Lúcia estava radiante com seu vestido vermelho e caminhando animadamente para a escola. O sol brilhava forte, prometendo um dia cheio de aventuras e alegrias com os novos amigos que ela faria.")
                    .font(.system(size: fontSize))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)

            HStack(spacing: 15) {
                Spacer()
                Button(action: {
                    self.fontSize -= 2
                }) {
                    Image(systemName: "minus.magnifyingglass")
                        .resizable()
                        .padding(.all, 5)
                }
                .disabled(fontSize <= minFontSize)
                .frame(width: 40, height: 40)

                Button(action: {
                    self.fontSize += 2
                }) {
                    Image(systemName: "plus.magnifyingglass")
                        .resizable()
                        .padding(.all, 5)
                }
                .disabled(fontSize >= maxFontSize)
                .frame(width: 40, height: 40)

                Spacer()
                    .frame(width: 5)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.gray.opacity(0.1))
        }
    }
}

#Preview {
    ScrollableStoryBookView()
}
