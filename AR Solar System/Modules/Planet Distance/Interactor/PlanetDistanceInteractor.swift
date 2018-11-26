import Foundation

final class PlanetDistanceInteractor: PlanetDistanceOutput {
    
    weak var view: PlanetDistanceInput?
    private(set) var category: PlanetCategory
    private let viewModel = ViewModelBuilder()
    
    init(planetCategory: PlanetCategory) {
        self.category = planetCategory
    }
    
    func onViewDidLoad() {
        let navigationInfo = viewModel.buildNavigationByIdentifier(identifier: self.category.identifier)
        view?.setNavigationInfo(model: navigationInfo)
        view?.setupUI(option: category.type)
    }
}
