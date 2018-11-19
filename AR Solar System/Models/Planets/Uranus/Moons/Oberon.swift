import Foundation
import ARKit

class Oberon: Planet {
    
    var ring = Ring(ringSize: 1.3)
    
    init(radius: CGFloat = 0.1, rotationSpeed: Float = 0.5) {
        super.init(radius: radius, planetName: UranusMoons.oberon.rawValue)
        
        self.position = SCNVector3(x: 1.3, y: 0, z: 0)
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
