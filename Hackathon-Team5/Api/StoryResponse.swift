import Foundation

struct StoryResponse : Codable, Identifiable {
    var id: Int? = nil
    let text: String
    let imageUrl: String
}

struct StoryResponseList : Codable, Identifiable {
    var id: Int? = nil
    let story: [StoryResponse]
}
