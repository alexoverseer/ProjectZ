import Foundation
import ARKit

final class JupiterAndMoons: PlanetBuilder {
    
    func build() -> SCNNode {
        return Jupiter(radius: 0.2, rotationSpeed: 1.5)
    }
}
