import Foundation
import ARKit

final class SolarSystemInteractor: SolarSystemOutput {
    
    weak var view: SolarSystemInput?
    
    var planetOptions = PlanetCategoryBuilder.buildCategories()
    
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
            return SCNNode()
        case .plutonAndCharon:
            return SCNNode()
        case .solarSystem:
            return SolarSystemPlanetBuilder().build()
        }
    }
}
