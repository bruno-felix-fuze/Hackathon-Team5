//
//  SelectableTag.swift
//  Hackathon-Team5
//
//  Created by Fernanda Carvalho on 04/06/24.
//

import Foundation

struct SelectableTag: Identifiable {
    let id: String
    let text: String
    var isSelected: Bool = false
}
