import SwiftUI

struct CharacterListView: View {

    let characters = CharacterFactory().mockCharacters()

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 170, maximum: 170))],
                spacing: 20
            ) {
                ForEach(characters, id: \.self) { character in
                    NavigationLink(destination: FormView()) {
                        CharacterView(imageName: character.imageName)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CharacterListView()
}
