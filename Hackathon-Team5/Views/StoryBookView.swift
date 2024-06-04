import SwiftUI

struct StoryBookView: View {

    let pages = [
        "Era uma vez em um mundo muito distante...",
        "Havia uma pequena aldeia cheia de amizade e alegria...",
        "Dentro da aldeia, uma criança tinha uma história para contar..."
    ]

    var body: some View {
        TabView {
            ForEach(pages.indices, id: \.self) { index in
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(.black)
                        .frame(height: 500)
                    ZStack {
                        Rectangle()
                            .fill(.white)
                        Text(pages[index])
                            .font(.system(size: 22, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}


#Preview {
    StoryBookView()
}
