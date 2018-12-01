import Foundation

final class PlanetFactInteractor: PlanetFactOutput {
   
    weak var view: PlanetFactInput?
    private(set) var planetCategory: PlanetCategory
    private let viewModel = ViewModelBuilder()
    private var facts = [PlanetFact]()
    
    init(planetCategory: PlanetCategory) {
        self.planetCategory = planetCategory
    }
    
    func onViewDidLoad() {
        facts = viewModel.buildPlanetFacts(identifier: self.planetCategory.identifier)
        view?.setTitle(title: self.planetCategory.title)
        view?.reloadData()
    }
}
