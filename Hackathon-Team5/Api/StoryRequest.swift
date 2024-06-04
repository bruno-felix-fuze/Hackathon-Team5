import Foundation

struct StoryRequest : Codable, Identifiable {
    var id: Int? = nil
    let character: String
    let theme: String
    let place: String
    let elements: [String]
    let kid: Kid
}

struct Kid : Codable, Identifiable {
    var id: Int? = nil
    let name: String
    let age: Int
}
