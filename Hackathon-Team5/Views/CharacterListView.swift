import SwiftUI

struct CharacterListView: View {
    let data: [Int]

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 170, maximum: 170))],
                spacing: 20
            ) {
                ForEach(data, id: \.self) { index in
                    CharacterView(image: .cao)
                }
            }
            .padding()
        }
    }
}

#Preview {
    CharacterListView(data: Array(1...6))
}
