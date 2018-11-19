import Foundation
import ARKit

class Pluto: Planet {
    
    let ring = Ring(ringSize: 2)
    
    init(radius: CGFloat = 0.02, rotationSpeed: Float = 0.4, moons: [Planet]? = nil) {
        super.init(radius: radius, planetName: Planets.pluto.rawValue)
        
        self.position = SCNVector3(x: 2, y: 0, z: 0)
        self.rotateObject(rotation: 0.1, duration: rotationSpeed)
        ring.rotateObject(rotation: 0.1, duration: 1)
        ring.addChildNode(self)
        
        guard let uranusMoons = moons else { return }
        _ = uranusMoons.map { self.addChildNode($0) }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planetWithRing() -> SCNNode {
        return ring
    }
}
