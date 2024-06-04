import SwiftUI

struct StoryTypeView : View {
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "powersleep")
                    Text("Dormir")
                }
                .buttonStyle(.bordered).tint(.blue)
                
                Button {
                    
                } label: {
                    Image(systemName: "book")
                    Text("Junto")
                }
                .buttonStyle(.bordered).tint(.purple)
            }.padding(20)
            
            Button {
                
            } label: {
                Image(systemName: "checkmark")
                Text("Criar")
            }.buttonStyle(.bordered).tint(.green)
            
        }
        
    }
}

#Preview {
    StoryTypeView()
}
