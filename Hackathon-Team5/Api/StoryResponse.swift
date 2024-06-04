import Foundation

struct StoryResponse : Codable, Identifiable {
    var id: Int? = nil
    var page: Int = 0
    var text: String = ""
    var illustration: String = ""
}

struct StoryResponseList : Codable, Identifiable {
    var id: Int? = nil
    var story: [StoryResponse] = Array()
}
