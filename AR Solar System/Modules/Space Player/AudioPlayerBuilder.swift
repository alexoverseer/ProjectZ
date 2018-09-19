import Foundation

final class AudioPlayerBuilder {
    
    static func build() -> AudioPlayerViewController {
        
        let viewController = AudioPlayerViewController.instantiate()
        viewController.interactor = createInteractor(with: viewController)
        
        return viewController
    }
    
    private static func createInteractor(with view: AudioPlayerInput) -> AudioPlayerOutput {
        let interactor = AudioPlayerInteractor()
        interactor.view = view
    
        return interactor
    }
}
