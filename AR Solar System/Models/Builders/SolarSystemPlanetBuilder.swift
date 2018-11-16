import Foundation
import ARKit

final class SolarSystemPlanetBuilder: PlanetBuilder {
    
    func build() -> SCNNode {
        let planets = [Sun(), Mercury(), Venus(), Earth(), Mars(), Jupiter(), Saturn(), Uranus(), Neptune(), Pluto()]
        
        return generateScene(with: planets)
    }
    
    private func generateScene(with planets: [Planet]) -> SCNNode {
        let baseNode = SCNNode()
        baseNode.position = SCNVector3(x: 0, y: -0.5, z: -1)
        _ = planets.map { baseNode.addChildNode($0.planetWithRing()) }
        
        return baseNode
    }
}
