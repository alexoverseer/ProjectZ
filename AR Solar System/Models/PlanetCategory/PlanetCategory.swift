import Foundation

final class PlanetCategory {
    let title: String
    let type: PlanetOption
    let identifier: String
    var isSelected: Bool
    
    init(title: String, type: PlanetOption, identifier: String, isSelected: Bool) {
        self.title = title
        self.type = type
        self.identifier = identifier
        self.isSelected = isSelected
    }
}
