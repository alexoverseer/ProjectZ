import Foundation
import ARKit

class Jupiter: Planet {
    
    var ring = Ring(ringSize: 1)
    
    init(radius: CGFloat = 0.12, rotationSpeed: Float = 0.4, moons: [Planet]? = nil) {
        super.init(radius: radius, planetName: Planets.jupiter)
        
        self.position = SCNVector3(x: 1, y: 0, z: 0)
        self.rotateObject(rotation: 0.45, duration: rotationSpeed)
        ring.rotateObject(rotation: 0.45, duration: 1)
        ring.addChildNode(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planetWithRing() -> SCNNode {
        return ring
    }
}
