import Foundation

final class PlanetDistanceInteractor: PlanetDistanceOutput {
    
    weak var view: PlanetDistanceInput?
    private(set) var category: PlanetCategory
    
    init(planetCategory: PlanetCategory) {
        self.category = planetCategory
    }
    
    func onViewDidLoad() {
        print(self.category.title)
    }
}
