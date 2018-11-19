import Foundation
import ARKit

class EuropaMoon: Planet {
    
    var ring = Ring(ringSize: 1.5)
    
    init(radius: CGFloat = 0.12, rotationSpeed: Float = 0.3) {
        super.init(radius: radius, planetName: JupiterMoons.europa.rawValue)
        
        self.position = SCNVector3(x: 1, y: 0, z: 0)
        ring.position = SCNVector3(x: 0, y: 0.02, z: 0)
        self.rotateObject(rotation: 0.2, duration: rotationSpeed)
        ring.rotateObject(rotation: 0.4, duration: 1.5)
        ring.addChildNode(self)
//        self.addChildNode(ring)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planetWithRing() -> SCNNode {
        
        return ring
    }
}
