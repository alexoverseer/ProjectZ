import Foundation
import ARKit

class Rethys: Planet {
    
    var ring = Ring(ringSize: 2)
    
    init(radius: CGFloat = 1, rotationSpeed: Float = 0.7) {
        super.init(radius: radius, planetName: SaturnMoons.rethys.rawValue)
        
        self.position = SCNVector3(x: 2, y: 0, z: 0)
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
