import Foundation

enum ThemeEnum : String {
    case Adventure = "Adventure"
    case SuperHero = "Super Hero"
    case FairyTale = "Fairy Tale"
    case Animal = "Animal"
    case Family = "Family"
    case Friendship = "Friendship"
    case BiblicalStory = "Biblical Story"
    
    func getThemes() -> [String] {
        return [
            ThemeEnum.Adventure.rawValue,
            ThemeEnum.SuperHero.rawValue,
            ThemeEnum.FairyTale.rawValue,
            ThemeEnum.Animal.rawValue,
            ThemeEnum.Family.rawValue,
            ThemeEnum.Friendship.rawValue,
            ThemeEnum.BiblicalStory.rawValue
        ]
    }
}
