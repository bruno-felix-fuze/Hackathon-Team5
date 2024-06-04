import SwiftUI

struct ContentView: View {
    
    private var data: [Int] = Array(1...6)
    
    var body: some View {
        NavigationView {
            Group {
                CharacterListView()
            }
            .navigationTitle("Personagens")
        }
    }
}

#Preview {
    ContentView()
}
