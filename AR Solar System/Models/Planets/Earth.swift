import Foundation
import ARKit

class Earth: Planet {
    
    var ring = Ring(ringSize: 0.7)
    
    init(radius: CGFloat = 0.05, rotationSpeed: Float = 0.4, moon: Planet = Moon()) {
        super.init(radius: radius, planetName: Planets.earth)
        
        self.position = SCNVector3(x: 0.7, y: 0, z: 0)
        self.rotateObject(rotation: 0.25, duration: rotationSpeed)
        ring.rotateObject(rotation: 0.25, duration: 1)
        ring.addChildNode(self)
        self.addChildNode(moon)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planetWithRing() -> SCNNode {
        return ring
    }
}
