import Foundation
import ARKit

final class SolarSystemInteractor: SolarSystemOutput {
    
    weak var view: SolarSystemInput?
    var livePhotoRecorder: LivePhotoRecorder!
    
    var planetOptions = PlanetCategoryBuilder.buildCategories()
    
    var selectedOption: PlanetCategory {
        return planetOptions.filter { $0.isSelected }.first ?? planetOptions[0]
    }
    
    var selectedPlanetIdentifier: String {
        return selectedOption.identifier
    }
    
    func viewDidLoad() {
        let generatedScene = getScene(for: PlanetOption(rawValue: 0)!)
        view?.setupSceneView(with: generatedScene)
    }
    
    func setNewPlanetType(for index: Int) {
        let generatedScene = getScene(for: PlanetOption(rawValue: index)!)
        view?.setupSceneView(with: generatedScene)
    }
    
    func getScene(for option: PlanetOption) -> SCNNode {
        
        switch option {
        case .mercury:
            return MercuryBuilder().build()
        case .venus:
            return VenusBuilder().build()
        case .earthAndMoon:
            return EarthAndMoonBuilder().build()
        case .mars:
            return MarsBuilder().build()
        case .jupiterAndMoons:
            return JupiterAndMoonsBuilder().build()
        case .saturnAndMoons:
            return SaturnAndMoonsBuilder().build()
        case .uranusAndMoons:
            return UranusAndMoonsBuilder().build()
        case .neptuneAndMoons:
            return NeptuneAndMoonsBuilder().build()
        case .plutonAndCharon:
            return PlutoAndMoonsBuilder().build()
        case .solarSystem:
            return SolarSystemPlanetBuilder().build()
        }
    }
}

// MARK: - LivePhotoRecorder

extension SolarSystemInteractor {
    
    func registerARSCNView(view: ARSCNView) {
        livePhotoRecorder.registerView(view: view)
        livePhotoRecorder.onEndRecording = { [weak self] saved, status in
            self?.view?.exportMessage(success: saved, status: status)
        }
    }
    
    func prepareRecorder(configuration: ARWorldTrackingConfiguration) {
        livePhotoRecorder.prepareRecorder(configuration: configuration)
    }
    
    func stopRecorder() {
        livePhotoRecorder.stopRecording()
    }
    
    func recordGIF() {
        livePhotoRecorder.startRecordGIF()
    }
    
    func recordLivePhoto() {
        livePhotoRecorder.startRecordLivePhoto()
    }
}
