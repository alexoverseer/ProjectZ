import Foundation
import ARKit

final class SaturnAndMoonsBuilder: PlanetBuilder {
    
    func build() -> SCNNode {
        let moons = [Dione(), Enceladus(), Mimas(), Tethys()]
        
        return Saturn(radius: 0.2, rotationSpeed: 1, moons: moons)
    }
}
