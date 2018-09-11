import Foundation
import ARKit

class Jupiter: Planet {
    
    var ring = Ring(ringSize: 1)
    
    init() {
        super.init(radius: 0.12, planetName: Planets.jupiter)
        
        self.position = SCNVector3(x: 1, y: 0, z: 0)
        self.rotateObject(rotation: 0.45, duration: 0.4)
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
