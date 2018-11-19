import Foundation
import ARKit

final class JupiterAndMoons: PlanetBuilder {
    
    func build() -> SCNNode {
        let moons = [IoMoon(), EuropaMoon(), GenymedeMoon(), CalistoMoon()]
        
        return Jupiter(radius: 0.2, rotationSpeed: 1.5, moons: moons)
    }
}
