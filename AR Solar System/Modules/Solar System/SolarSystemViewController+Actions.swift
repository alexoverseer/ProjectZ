import Foundation
import Toast_Swift

extension SolarSystemViewController {
    
    // MARK: - Actions
    
    @IBAction private func showManInSpace() {
        let controller = SpaceManListBuilder.build()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction private func showAudioPlayer() {
        let controller = AudioPlayerBuilder.build()
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction private func showFactsAboutPlanet() {
        let planetCategory = interactor.selectedOption
        let controller = PlanetFactBuilder.build(with: planetCategory)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction private func showDistanceFromEarth() {
        let planetCategory = interactor.selectedOption
        let controller = PlanetDistanceBuilder.build(with: planetCategory)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction private func recordGif() {
        view.makeToast("Capturing GIF, please wait.")
        interactor.recordGIF()
    }
    
    @IBAction private func recordLivePhoto() {
        view.makeToast("Capturing Live Photo, please wait.")
        interactor.recordLivePhoto()
    }
}
