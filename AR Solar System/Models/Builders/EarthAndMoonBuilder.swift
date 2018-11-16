import Foundation
import ARKit

final class EarthAndMoonBuilder: PlanetBuilder {
    
    func build() -> SCNNode {
        let moon = Moon(radius: 0.1, offset: 0.5)
        return Earth(radius: 0.2, rotationSpeed: 1, moon: moon)
    }
}
