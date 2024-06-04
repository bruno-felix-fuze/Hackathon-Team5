//
//  SelectableTagsView.swift
//  Hackathon-Team5
//
//  Created by Fernanda Carvalho on 04/06/24.
//

import SwiftUI

struct SelectableTag: Identifiable {
    let id: String
    let text: String
    var isSelected: Bool = false
}

struct SelectableTagsView: View {
    @State private var tags: [SelectableTag] = [
        SelectableTag(id: "1", text: "Navio"),
        SelectableTag(id: "2", text: "Pirata"),
        SelectableTag(id: "3", text: "Tubarão"),
        SelectableTag(id: "4", text: "Tempestade"),
        SelectableTag(id: "5", text: "Carros voadores"),
        SelectableTag(id: "6", text: "Bruxa má")
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach($tags) { $tag in
                    ZStack(alignment: .topTrailing) {
                        Text(tag.text)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(tag.isSelected ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .onTapGesture {
                                tag.isSelected.toggle()
                            }
                    }
                }
            }
        }
    }
}
#Preview {
    SelectableTagsView()
}
