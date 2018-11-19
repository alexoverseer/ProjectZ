import Foundation
import ARKit

class Mercury: Planet {
    
    var ring = Ring(ringSize: 0.3)
    
    init(radius: CGFloat = 0.03, rotationSpeed: Float = 0.4) {
        super.init(radius: radius, planetName: Planets.mercury.rawValue)
        
        self.position = SCNVector3(x: 0.3, y: 0, z: 0)
        self.rotateObject(rotation: 0.6, duration: rotationSpeed)
        ring.rotateObject(rotation: 0.6, duration: 1)
        ring.addChildNode(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planetWithRing() -> SCNNode {
        return ring
    }
}
