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
}

final class PlanetCategory {
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

final class PlanetCategoryBuilder {
    
    static func buildCategories() -> [PlanetCategory] {
        let categories = [PlanetCategory(title: "Mercury", imageName: "", type: .mercury, isSelected: true),
                          PlanetCategory(title: "Venus", imageName: "", type: .venus, isSelected: false),
                          PlanetCategory(title: "Earth & Moon", imageName: "", type: .earthAndMoon, isSelected: false),
                          PlanetCategory(title: "Mars", imageName: "", type: .mars, isSelected: false),
                          PlanetCategory(title: "Jupiter & Moons", imageName: "", type: .jupiterAndMoons, isSelected: false),
                          PlanetCategory(title: "Saturn & Moons", imageName: "", type: .saturnAndMoons, isSelected: false),
                          PlanetCategory(title: "Uranus & Moons", imageName: "", type: .uranusAndMoons, isSelected: false),
                          PlanetCategory(title: "Neptune & Triton", imageName: "", type: .neptuneAndMoons, isSelected: false),
                          PlanetCategory(title: "Pluton & Charon", imageName: "", type: .plutonAndCharon, isSelected: false),
                          PlanetCategory(title: "Solar System", imageName: "", type: .solarSystem, isSelected: false)]
        
        return categories
    }
}
