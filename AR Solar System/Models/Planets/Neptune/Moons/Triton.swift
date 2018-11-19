import Foundation
import ARKit

class Triton: Planet {
    
    var ring = Ring(ringSize: 0.8)
    
    init(radius: CGFloat = 0.08, rotationSpeed: Float = 1) {
        super.init(radius: radius, planetName: NeptuneMoons.triton.rawValue)
        
        self.position = SCNVector3(x: 0.8, y: 0, z: 0)
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
