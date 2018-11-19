import Foundation
import ARKit

final class NeptuneAndMoonsBuilder: PlanetBuilder {
    
    func build() -> SCNNode {
        let moons = [Triton()]
        
        return Uranus(radius: 0.3, rotationSpeed: 1, moons: moons)
    }
}
