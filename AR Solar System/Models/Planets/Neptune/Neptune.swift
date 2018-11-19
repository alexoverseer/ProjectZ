import Foundation
import ARKit

class Neptune: Planet {
    
    let ring = Ring(ringSize: 1.7)
    
    init(radius: CGFloat = 0.08, rotationSpeed: Float = 0.4, moons: [Planet]? = nil) {
        super.init(radius: radius, planetName: Planets.neptune.rawValue)
        
        self.position = SCNVector3(x: 1.7, y: 0, z: 0)
        self.rotateObject(rotation: 0.2, duration: rotationSpeed)
        ring.rotateObject(rotation: 0.2, duration: 1)
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
