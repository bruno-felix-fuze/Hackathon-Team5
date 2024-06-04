import SwiftUI

struct ContentView: View {
    
    private var data: [Int] = Array(1...6)
    private let images: [ImageResource] = [
        .cao, .gato, .leao, .cavalo, .macaco, .ursoPanda
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 170, maximum: 170))],
                    spacing: 20
                ) {
                    ForEach(data, id: \.self) { index in
                        ZStack {
                            Circle()
                                .fill(.white.shadow(.drop(color: .black, radius: 4)))
                                //.stroke(.black, lineWidth: 3)
                                .frame(width: 150, height: 150)
                            Image(images[index - 1])
                                .resizable()
                                .frame(width: 100, height: 100)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Temas")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                      // Do an action...
                    }) {
                        Image(systemName: "plus").foregroundColor(.black)
                    }
              }
            }
        }
    }
}

#Preview {
    ContentView()
}
