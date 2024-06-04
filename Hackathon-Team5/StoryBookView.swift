import SwiftUI

struct StoryBookView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(.black)
                .frame(height: 500)
            ZStack {
                Rectangle()
                    .fill(.white)
                Text("Era uma vez em um mundo muito distante...")
                    .font(.system(size: 28, weight: .semibold))
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
}

#Preview {
    StoryBookView()
}
