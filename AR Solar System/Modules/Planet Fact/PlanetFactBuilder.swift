import Foundation

final class PlanetFactBuilder {
    
    static func build(with planetCategory: PlanetCategory) -> PlanetFactViewController {
        let viewController = PlanetFactViewController.instantiate()
        viewController.interactor = createInteractor(with: viewController,
                                                     planetCategory: planetCategory)
        
        return viewController
    }
    
    private static func createInteractor(with view: PlanetFactInput,
                                         planetCategory: PlanetCategory) -> PlanetFactOutput {
        
        let interactor = PlanetFactInteractor(planetCategory: planetCategory)
        interactor.view = view
        
        return interactor
    }
}
