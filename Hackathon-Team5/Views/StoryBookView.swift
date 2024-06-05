import SwiftUI

struct StoryBookView: View {
    
    @ObservedObject private var api: TellYaApi
    
    init(api: TellYaApi) {
        self.api = api
    }

    var body: some View {        
        TabView {
            ForEach(api.story.indices, id: \.self) { index in
                GeometryReader { gp in
                    VStack() {
                        ZStack {
                            AsyncImage(url: URL(string: api.story[index].illustration)) { image in
                                image.resizable()
                            } placeholder: {
                                Color.gray.opacity(0.3)
                            }.frame(width: gp.size.width, height: gp.size.height * 0.7)
                                .aspectRatio(contentMode: .fit)
                                
                        }.frame(width: gp.size.width, height: gp.size.height * 0.7)

                        ZStack {
                            Rectangle()
                                .fill(.white)
                            Text(api.story[index].text)
                                .font(.system(size: 22, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .padding()
                        }.frame(width: gp.size.width, height: gp.size.height * 0.3)
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}


#Preview {
    StoryBookView(api: .init(initialState: .init()))
}
