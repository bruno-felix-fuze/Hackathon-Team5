import Foundation

struct StoryRequest : Codable {
    let character: String
    let theme: String
    let place: String
    let elements: [String]
    let kid: Kid
}

struct Kid : Codable {
    let name: String
    let age: Int
}
