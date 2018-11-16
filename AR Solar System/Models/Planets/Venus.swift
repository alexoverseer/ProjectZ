import Foundation
import ARKit

class Venus: Planet {
    
    var ring = Ring(ringSize: 0.5)
    
    init(radius: CGFloat = 0.04, rotationSpeed: Float = 0.4) {
        super.init(radius: radius, planetName: Planets.venus)
        
        self.position = SCNVector3(x: 0.5, y: 0, z: 0)
        self.rotateObject(rotation: 0.4, duration: rotationSpeed)
        ring.rotateObject(rotation: 0.4, duration: 1)
        ring.addChildNode(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planetWithRing() -> SCNNode {
        return ring
    }
}
