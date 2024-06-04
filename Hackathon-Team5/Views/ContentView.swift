import SwiftUI

struct ContentView: View {
    
    private var data: [Int] = Array(1...6)
    
    var body: some View {
        NavigationView {
            Group {
                CharacterListView(data: data)
            }
            .navigationTitle("Personagens")
        }
    }
}

#Preview {
    ContentView()
}
