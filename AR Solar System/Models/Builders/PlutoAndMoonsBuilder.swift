import Foundation
import ARKit

final class PlutoAndMoonsBuilder: PlanetBuilder {
    
    func build() -> SCNNode {
        let moons = [Charon()]
        
        return Pluto(radius: 0.3, rotationSpeed: 0.5, moons: moons)
    }
}
