import Foundation
import ARKit

class Mars: Planet {
    
    var ring = Ring(ringSize: 0.8)
    
    init(radius: CGFloat = 0.03, rotationSpeed: Float = 0.4) {
        super.init(radius: radius, planetName: Planets.mars.rawValue)
        
        self.position = SCNVector3(x: 0.8, y: 0, z: 0)
        self.rotateObject(rotation: 0.2, duration: rotationSpeed)
        ring.rotateObject(rotation: 0.2, duration: 1)
        ring.addChildNode(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planetWithRing() -> SCNNode {
        return ring
    }
}
