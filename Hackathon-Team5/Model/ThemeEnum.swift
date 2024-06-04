import Foundation

enum ThemeEnum : String {
    case Adventure = "Aventura"
    case SuperHero = "Super Herói"
    case FairyTale = "Conto de Fadas"
    case Animal = "Animais"
    case Family = "Família"
    case Friendship = "Amizade"
    case BiblicalStory = "História Bíblica"
}

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
