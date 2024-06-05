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

    // MARK: States
    @State private var selectedStoryType: StoryType = .sleep
    @State private var isHidden: Bool = false
    
    // MARK: Observers
    @ObservedObject private var api: TellYaApi
    
    let defaults = UserDefaults.standard
    var character: String = ""
    var name: String = ""
    var age: String = ""
    var theme: String = ""
    var place: String = ""
    
    private func generateStory() {
        let storyRequest = StoryRequest(
            character: defaults.object(forKey:"character") as? String ?? "",
            theme: defaults.object(forKey:"theme") as? String ?? "",
            place: defaults.object(forKey:"place") as? String ?? "",
            elements: ["ship", "pirate", "shark", "storm"],
            kid: Kid(
                name: defaults.object(forKey:"name") as? String ?? "",
                age: Int(defaults.object(forKey:"age") as? String ?? "0") ?? 0
            )
        )
        //self.api.mockGenerateStory()
        self.api.generateStory(story: storyRequest)
    }

    init(api: TellYaApi) {
        self.api = api
    }
    
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

            createButton
            loadingProgress
            
            if api.isSuccess && selectedStoryType == .sleep {
                NavigationLink(destination: ScrollableStoryBookView()) {
                    createStartButton
                }
            } else if api.isSuccess && selectedStoryType == .together {
                NavigationLink(destination: StoryBookView(api: self.api)) {
                    createStartButton
                }
            }
        }
        .navigationTitle("História")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.all, 20)
    }
    
    private var loadingProgress: some View {
        VStack {
            ProgressView().progressViewStyle(CircularProgressViewStyle())
            Text("Criando sua história...")
        }.opacity(isHidden && !api.isSuccess ? 1 : 0)
    }

    private var createButton: some View {
        Text("Criar história")
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .multilineTextAlignment(.center)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(25)
            .opacity(isHidden ? 0 : 1)
            .onTapGesture {
                isHidden = true
                generateStory()
            }
    }
    
    private var createStartButton: some View {
        Text("Começar")
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .multilineTextAlignment(.center)
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(25)
            .opacity(isHidden && api.isSuccess ? 1 : 0)
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
