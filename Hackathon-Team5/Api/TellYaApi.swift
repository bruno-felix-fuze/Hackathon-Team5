import Foundation

final class TellYaApi : ObservableObject {
    
    @Published private(set) var storyResponse: StoryResponseList
    
    init(initialState: StoryResponseList = .init()) {
        self.storyResponse = initialState
    }
    
    func generateStory(story: StoryRequest) {
        guard let url = URL(string:  "https://us-central1-tell-ya.cloudfunctions.net/generateStory") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
        do {
            let jsonData = try JSONEncoder().encode(story)
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    print("data= \(data)")
                    print("response= \(response)")
                }
            }.resume()
        } catch {
            DispatchQueue.main.async {
                print("Failed to encode story request")
            }
        }
    }
}
