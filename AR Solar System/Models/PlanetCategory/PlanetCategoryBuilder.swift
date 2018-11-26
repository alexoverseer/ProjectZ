import Foundation

final class PlanetCategoryBuilder {
    
    static func buildCategories() -> [PlanetCategory] {
        let categories = [PlanetCategory(title: "Mercury",
                                         type: .mercury,
                                         identifier: "fcc464d1-4376-4464-ac91-5c01914beadd",
                                         isSelected: true),
                          PlanetCategory(title: "Venus",
                                         type: .venus,
                                         identifier: "e8871327-6f09-41a7-a862-eb384324cee2",
                                         isSelected: false),
                          PlanetCategory(title: "Earth & Moon",
                                         type: .earthAndMoon,
                                         identifier: "c3da0235-8dab-486d-a887-1dd9c684da70",
                                         isSelected: false),
                          PlanetCategory(title: "Mars",
                                         type: .mars,
                                         identifier: "4bc704d9-49f2-41d1-86fe-ecab39a348c2",
                                         isSelected: false),
                          PlanetCategory(title: "Jupiter & Moons",
                                         type: .jupiterAndMoons,
                                         identifier: "e0f5b8bc-cade-40b3-8292-26cdcd2ba5dc",
                                         isSelected: false),
                          PlanetCategory(title: "Saturn & Moons",
                                         type: .saturnAndMoons,
                                         identifier: "8bcc6a3e-6d4b-45a3-8884-64c698469a5d",
                                         isSelected: false),
                          PlanetCategory(title: "Uranus & Moons",
                                         type: .uranusAndMoons,
                                         identifier: "1edc326d-1703-485b-90c6-448de8d30ab8",
                                         isSelected: false),
                          PlanetCategory(title: "Neptune & Triton",
                                         type: .neptuneAndMoons,
                                         identifier: "1c049999-8d75-4763-a8ea-fa76477aa511",
                                         isSelected: false),
                          PlanetCategory(title: "Pluton & Charon",
                                         type: .plutonAndCharon,
                                         identifier: "89e578ce-3337-4099-9409-e52a75022ff3",
                                         isSelected: false),
                          PlanetCategory(title: "Solar System",
                                         type: .solarSystem,
                                         identifier: "3dc35087-ff99-4184-ab8e-6eb1769f9c09",
                                         isSelected: false)]
        
        return categories
    }
}
