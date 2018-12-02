import UIKit

final class SolarSystemBuilder {
    
    static func build() -> UIViewController {
        let viewController = SolarSystemViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: viewController)
        setNavigationBarAppearance(for: navigationController.navigationBar)
        viewController.interactor = createInteractor(with: viewController)
        
        return navigationController
    }
    
    private static func createInteractor(with view: SolarSystemInput) -> SolarSystemOutput {
        let interactor = SolarSystemInteractor()
        interactor.view = view
        interactor.livePhotoRecorder = DefaultLivePhotoRecorder()
        
        return interactor
    }
    
    private static func setNavigationBarAppearance(for navigationBar: UINavigationBar) {
        let lightAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationBar.titleTextAttributes = lightAttributes
        navigationBar.largeTitleTextAttributes = lightAttributes
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.tintColor = UIColor.white
    }
}
