import UIKit

final class SolarSystemBuilder {
    
    static func build() -> UIViewController {
        let viewController = SolarSystemViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.tintColor = UIColor.white
        
        viewController.interactor = createInteractor(with: viewController)
        
        return navigationController
    }
    
    private static func createInteractor(with view: SolarSystemInput) -> SolarSystemOutput {
        let interactor = SolarSystemInteractor()
        interactor.view = view
        
        return interactor
    }
}
