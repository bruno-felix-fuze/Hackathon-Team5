import SwiftUI

struct CharacterListView: View {

    let defaults = UserDefaults.standard
    let characters = CharacterFactory().mockCharacters()

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 170, maximum: 170))],
                spacing: 20
            ) {
                ForEach(characters, id: \.self) { character in
                    NavigationLink(destination: FormView()) {
                        CharacterView(
                            imageName: character.imageName,
                            characterName: character.description
                        )
                    }.simultaneousGesture(TapGesture().onEnded {
                        defaults.set(character.description, forKey: "character")
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    CharacterListView()
}
