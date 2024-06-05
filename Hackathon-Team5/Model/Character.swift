//
//  Character.swift
//  Hackathon-Team5
//
//  Created by Fernanda Carvalho on 04/06/24.
//

import Foundation

struct Character: Hashable {
    let description: String
    let imageName: String
}

struct CharacterFactory {
    func mockCharacters() -> [Character] {
        var characters = [Character]()
        characters.append(
            Character
                .init(
                    description: "Criança do gênero feminino, loira, de cabelos longos com maria chiquinha, com vestido verde, na cadeira de rodas",
                    imageName: "character0"
                )
        )
        characters.append(
            Character
                .init(
                    description: "Criança do gênero feminino, negra, de cabelos crespos, com vestido vermelho, tênis branco, e pulseiras coloridas",
                    imageName: "character1"
                )
        )
        characters.append(
            Character
                .init(
                    description: "Criança do gênero feminino, ruiva, de cabelo chanel, com sardas no rosto, vestido azul escuro, laço branco no cabelo e chinelos brancos",
                    imageName: "character2"
                )
        )
        characters.append(
            Character
                .init(
                    description: "Criança do gênero masculino, de cabelos claros e curtos, com blusa branca e short azul, óculos de grau preto e boné vermelho",
                    imageName: "character3"
                )
        )
        characters.append(
            Character
                .init(
                    description: "Criança do gênero masculino, de cabelos enrolados e comprimento médio, roupa preta, aparelho ortodôntico nos dentes e tênis vermelho",
                    imageName: "character4"
                )
        )
        characters.append(
            Character
                .init(
                    description: "Sapo amarelo, com pé grande",
                    imageName: "character5"
                )
        )
        characters.append(
            Character
                .init(
                    description: "Unicórnio branco com chifre de marshmallow e asas brilhantes",
                    imageName: "character6"
                )
        )
        characters.append(
            Character
                .init(
                    description: "Violão de 6 cordas, na cor marrom, com asas coloridas",
                    imageName: "character7"
                )
        )
        return characters
    }
}
