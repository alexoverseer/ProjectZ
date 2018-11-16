import Foundation
import ARKit

final class VenusBuilder: PlanetBuilder {
    
    func build() -> SCNNode {
        return Venus(radius: 0.2, rotationSpeed: 3)
    }
}
