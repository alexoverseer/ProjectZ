import Foundation

enum PlanetOption: Int {
    case mercury
    case venus
    case earthAndMoon
    case mars
    case jupiterAndMoons
    case saturnAndMoons
    case uranusAndMoons
    case neptuneAndMoons
    case plutonAndCharon
    case solarSystem
    
    var name: String {
        switch self {
        case .mercury:
            return "Mercury"
        case .venus:
            return "Menus"
        case .earthAndMoon:
            return "Moon"
        case .mars:
            return "Mars"
        case .jupiterAndMoons:
            return "Jupiter"
        case .saturnAndMoons:
            return "Saturn"
        case .uranusAndMoons:
            return "Uranus"
        case .neptuneAndMoons:
            return "Neptune"
        case .plutonAndCharon:
            return "Pluto"
        case .solarSystem:
            return "Earth"
        }
    }
}
