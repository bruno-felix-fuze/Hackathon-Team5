import SwiftUI

enum StoryType: String, CaseIterable {
    case sleep = "Dormir"
    case together = "Ler junto"
}

struct SegmentControlItem {
    var type: StoryType
    var iconString: String
}

struct StoryTypeView: View {

    @State private var selectedStoryType: StoryType = .sleep

    let options: [SegmentControlItem] = [
        SegmentControlItem(type: .sleep, iconString: "moon.zzz"),
        SegmentControlItem(type: .together, iconString: "books.vertical")
    ]

    var body: some View {
        VStack {
            Text("Essa história será contada para a criança dormir ou para ter um momento de leitura em família?")
                .font(.headline)
                .multilineTextAlignment(.leading)

            SegmentControl(
                selectedIndex: $selectedStoryType,
                options: options
            )
            .frame(height: 30)
            .padding(.top, 20)

            Spacer()


            if selectedStoryType == .sleep {
                NavigationLink(destination: ScrollableStoryBookView()) {
                    createButton
                }
            } else {
                NavigationLink(destination: StoryBookView()) {
                    createButton
                }
            }
        }
        .navigationTitle("História")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.all, 20)
    }

    private var createButton: some View {
        Text("Criar história")
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .multilineTextAlignment(.center)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(25)
    }
}

struct SegmentControl: View {
    @Binding var selectedIndex: StoryType
    let options: [SegmentControlItem]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(options, id: \.type) { option in
                HStack(spacing: 6) {
                    Image(systemName: option.iconString)
                    Text(option.type.rawValue)
                }
                .foregroundColor(selectedIndex == option.type ? .white : .primary)
                .padding()
                .frame(maxWidth: .infinity)
                .background(selectedIndex == option.type ? Color.blue : Color.clear)
                .cornerRadius(30)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.150)) {
                        selectedIndex = option.type
                    }
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                .foregroundColor(.clear)
        )
    }
}

#Preview {
    StoryTypeView()
}
