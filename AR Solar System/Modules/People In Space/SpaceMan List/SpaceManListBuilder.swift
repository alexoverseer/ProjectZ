import Foundation

final class SpaceManListBuilder {
    
    static func build() -> SpaceManListViewController {
        
        let viewController = SpaceManListViewController.instantiate()
        viewController.interactor = createInteractor(with: viewController)
        
        return viewController
    }
    
    private static func createInteractor(with view: SpaceManListInput) -> SpaceManListOutput {
        let interactor = SpaceManListInteractor()
        interactor.view = view
        
        return interactor
    }
}
