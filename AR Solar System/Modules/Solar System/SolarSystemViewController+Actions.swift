import Foundation

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
    
    @IBAction func showFactsAboutPlanet() {
        let planetCategory = interactor.selectedOption
        let controller = PlanetFactBuilder.build(with: planetCategory)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func showDistanceFromEarth() {
        let planetCategory = interactor.selectedOption
        let controller = PlanetDistanceBuilder.build(with: planetCategory)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction private func recordGif() {
        interactor.recordGIF()
    }
    
    @IBAction private func recordLivePhoto() {
        interactor.recordLivePhoto()
    }
}
