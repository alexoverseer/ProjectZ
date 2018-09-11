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
    case sunEarthAndMoon
}

class PlanetCategory {
    let title: String
    let imageName: String
    let type: PlanetOption
    var isSelected: Bool
    
    init(title: String, imageName: String, type: PlanetOption, isSelected: Bool) {
        self.title = title
        self.imageName = imageName
        self.type = type
        self.isSelected = isSelected
    }
}
