import Foundation

enum PlaceEnum : String {
    case Forest = "Floresta"
    case City = "Cidade"
    case Beach = "Praia"
    case DeepOcean = "Oceano"
    case School = "Escola"
}

func getPlaces() -> [String] {
    return [
        PlaceEnum.Forest.rawValue,
        PlaceEnum.City.rawValue,
        PlaceEnum.Beach.rawValue,
        PlaceEnum.DeepOcean.rawValue,
        PlaceEnum.School.rawValue
    ]
}
