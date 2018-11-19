import Foundation
import ARKit

class Mimas: Planet {
    
    var ring = Ring(ringSize: 1.5)
    
    init(radius: CGFloat = 0.15, rotationSpeed: Float = 0.6) {
        super.init(radius: radius, planetName: SaturnMoons.mimas.rawValue)
        
        self.position = SCNVector3(x: 1.5, y: 0, z: 0)
        self.rotateObject(rotation: 1, duration: rotationSpeed)
        ring.addChildNode(self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planetWithRing() -> SCNNode {
        
        return ring
    }
}
