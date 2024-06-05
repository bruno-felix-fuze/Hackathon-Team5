//
//  CharacterView.swift
//  Hackathon-Team5
//
//  Created by Fernanda Carvalho on 04/06/24.
//

import SwiftUI

struct CharacterView: View {
    let imageName: String
    let characterName: String

    var body: some View {
        ZStack {
            Circle()
                .fill(.white.shadow(.drop(color: .black.opacity(0.4), radius: 4)))
                .frame(width: 150, height: 150)

            Image(imageName)
                .resizable()
                .frame(width: 140, height: 140)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(70)
        }
    }
}

#Preview {
    CharacterView(imageName: "character0", characterName: "princess")
}
