import Foundation

final class PlanetDistanceBuilder {
    
    static func build(with planetCategory: PlanetCategory) -> PlanetDistanceViewController {
        
        let viewController = PlanetDistanceViewController.instantiate()
        viewController.interactor = createInteractor(with: viewController,
                                                     category: planetCategory)
        
        return viewController
    }
    
    private static func createInteractor(with view: PlanetDistanceInput,
                                         category: PlanetCategory) -> PlanetDistanceOutput {
        let interactor = PlanetDistanceInteractor(planetCategory: category)
        interactor.view = view
        
        return interactor
    }
    
}
