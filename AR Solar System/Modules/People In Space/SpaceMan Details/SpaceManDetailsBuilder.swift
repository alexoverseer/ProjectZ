import Foundation

final class SpaceManDetailsBuilder {
    
    static func build(with spaceMan: SpaceMan) -> SpaceManDetailsViewController {
        
        let viewController = SpaceManDetailsViewController.instantiate()
        viewController.interactor = createInteractor(from: viewController,
                                                     with: spaceMan)
        
        return viewController
    }
    
    private static func createInteractor(from view: SpaceManDetailsInput,
                                         with spaceMan: SpaceMan) -> SpaceManDetailsOutput {
        
        let interactor = SpaceManDetailsInteractor(spaceMan: spaceMan)
        interactor.view = view
        
        return interactor
    }
}
