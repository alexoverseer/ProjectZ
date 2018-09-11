import Foundation
import ARKit

protocol SolarSystemInput: class {
    func setupSceneView(with node: SCNNode)
}

protocol SolarSystemOutput {
    var planetOptions: [PlanetCategory] { get }
    func viewDidLoad()
    func setNewPlanetType(for index: Int)
}

final class SolarSystemInteractor: SolarSystemOutput {
    
    weak var view: SolarSystemInput?
    
    var planetOptions = [PlanetCategory(title: "Mercury", imageName: "", type: .mercury, isSelected: true),
                         PlanetCategory(title: "Venus", imageName: "", type: .venus, isSelected: false),
                         PlanetCategory(title: "Earth & Moon", imageName: "", type: .earthAndMoon, isSelected: false),
                         PlanetCategory(title: "Mars", imageName: "", type: .mars, isSelected: false),
                         PlanetCategory(title: "Jupiter & Moons", imageName: "", type: .jupiterAndMoons, isSelected: false),
                         PlanetCategory(title: "Saturn & Moons", imageName: "", type: .saturnAndMoons, isSelected: false),
                         PlanetCategory(title: "Uranus & Moons", imageName: "", type: .uranusAndMoons, isSelected: false),
                         PlanetCategory(title: "Neptune & Triton", imageName: "", type: .neptuneAndMoons, isSelected: false),
                         PlanetCategory(title: "Pluton & Charon", imageName: "", type: .plutonAndCharon, isSelected: false),
                         PlanetCategory(title: "Solar System", imageName: "", type: .solarSystem, isSelected: false),
                         PlanetCategory(title: "Sun, Earth & Moon", imageName: "", type: .sunEarthAndMoon, isSelected: false)]
    
    func viewDidLoad() {
        
        let planetConfiguration = getPlanets(for: PlanetOption(rawValue: 0)!)
        let generatedScene = generateScene(with: planetConfiguration)
        view?.setupSceneView(with: generatedScene)
    }
    
    func setNewPlanetType(for index: Int) {
        let planetConfiguration = getPlanets(for: PlanetOption(rawValue: index)!)
        let generatedScene = generateScene(with: planetConfiguration)
        view?.setupSceneView(with: generatedScene)
    }
    
    func getPlanets(for option: PlanetOption) -> [Planet] {
        
        switch option {
        case .mercury:
            return [Mercury()]
        case .venus:
            return [Planet]()
        case .earthAndMoon:
            return [Planet]()
        case .mars:
            return [Planet]()
        case .jupiterAndMoons:
            return [Planet]()
        case .saturnAndMoons:
            return [Planet]()
        case .uranusAndMoons:
            return [Planet]()
        case .neptuneAndMoons:
            return [Planet]()
        case .plutonAndCharon:
            return [Planet]()
        case .solarSystem:
            return [Sun(), Mercury(), Venus(), Earth(), Mars(), Jupiter(), Saturn(), Uranus(), Neptune(), Pluto()]
        case .sunEarthAndMoon:
            return [Planet]()
        }
    }
    
    func generateScene(with planets: [Planet]) -> SCNNode {
        let baseNode = SCNNode()
        baseNode.position = SCNVector3(x: 0, y: -0.5, z: -1)
        _ = planets.map { baseNode.addChildNode($0.planetWithRing()) }
        return baseNode
    }
}
