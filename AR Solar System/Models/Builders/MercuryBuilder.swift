import Foundation
import ARKit

final class MercuryBuilder: PlanetBuilder {
    
    func build() -> SCNNode {
        return Mercury(radius: 0.2, rotationSpeed: 3)
    }
}
