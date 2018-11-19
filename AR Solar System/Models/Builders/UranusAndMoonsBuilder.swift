import Foundation
import ARKit

final class UranusAndMoonsBuilder: PlanetBuilder {
    
    func build() -> SCNNode {
        let moons = [Ariel(), Miranda(), Oberon(), Titania(), Umbriel()]
        
        return Uranus(radius: 0.2, rotationSpeed: 1, moons: moons)
    }
}
