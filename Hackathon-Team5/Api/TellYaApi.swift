import Foundation

class TellYaApi {
    
    let apiUrl: String = ""

    func fetchStories(completion:@escaping (StoryResponseList?) -> ()) {
        guard let url = URL(string: apiUrl) else { return }

        URLSession.shared.dataTask(with: url) { data, _, _  in
            if let response = data {
                let story = try? JSONDecoder().decode(StoryResponseList.self, from: response)
                DispatchQueue.main.async {
                    completion(story)
                }
            }
        }
        .resume()
    }
    
    func postStory(story: StoryRequest) {
        guard let url = URL(string: apiUrl) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
        do {
            let jsonData = try JSONEncoder().encode(story)
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    DispatchQueue.main.async {
                        print("\(error)")
                    }
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                    DispatchQueue.main.async {
                        print("Failed with status code: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    print("Story request sent successfully")
                }
            }.resume()
        } catch {
            DispatchQueue.main.async {
                print("Failed to encode story request")
            }
        }
    }
    
    func get() async throws -> StoryResponseList {
        return try await withCheckedThrowingContinuation { continuation in
            let service = MainService()
            guard let url = URL(string: apiUrl) else {
                continuation.resume(
                    throwing: NetworkError.unknownError(
                        message: NSLocalizedString("Issue_while_processing_request", comment: "Get story request URL error")
                    )
                )
                return
            }
            
            service.get(url: url) { (result: Result<StoryResponseList, NetworkError>) in
                switch result {
                    case .success(let list):
                        continuation.resume(returning: list)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                }
            }
        }
    }
}
