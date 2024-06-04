import Foundation

enum PlaceEnum : String {
    case Forest = "Forest"
    case City = "City"
    case Beach = "Beach"
    case DeepOcean = "Deep Ocean"
    case School = "School"
    
    func getPlaces() -> [String] {
        return [
            PlaceEnum.Forest.rawValue,
            PlaceEnum.City.rawValue,
            PlaceEnum.Beach.rawValue,
            PlaceEnum.DeepOcean.rawValue,
            PlaceEnum.School.rawValue
        ]
    }
}
