import Foundation
import ARKit

final class MarsBuilder: PlanetBuilder {
    
    func build() -> SCNNode {
        return Mars(radius: 0.2, rotationSpeed: 1.5)
    }
}
