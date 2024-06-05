import Foundation

final class TellYaApi : ObservableObject {
    
    @Published private(set) var story: [StoryResponse]
    @Published private(set) var isSuccess: Bool = false
    
    init(initialState: [StoryResponse] = .init()) {
        self.story = initialState
    }
    
    func mockGenerateStory()  {
        guard let url = Bundle.main.url(forResource: "MockResponse", withExtension: "json") else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let list = try? JSONDecoder().decode([StoryResponse].self, from: data!)
        self.story = list ?? Array()
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
                    if let data = data {
                        do {
                            let result = try JSONDecoder().decode([StoryResponse].self, from: data)
                            self.story = result
                            self.isSuccess = true
                        } catch {
                            print("error= \(error)")
                            self.isSuccess = false
                        }
                    }
                }
            }.resume()
        } catch {
            DispatchQueue.main.async {
                print("Failed to encode story request")
            }
        }
    }
}
