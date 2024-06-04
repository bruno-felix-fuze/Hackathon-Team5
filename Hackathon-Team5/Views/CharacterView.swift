//
//  CharacterView.swift
//  Hackathon-Team5
//
//  Created by Fernanda Carvalho on 04/06/24.
//

import SwiftUI

struct CharacterView: View {
    let image: ImageResource

    var body: some View {
        ZStack {
            Circle()
                .fill(.white.shadow(.drop(color: .black.opacity(0.2), radius: 4)))
                .frame(width: 150, height: 150)

            Image(image)
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
        }
    }
}

#Preview {
    CharacterView(image: .cao)
}
