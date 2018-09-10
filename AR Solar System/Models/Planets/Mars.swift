import Foundation
import ARKit

class Mars: Planet {
    
    var ring = Ring(ringSize: 0.8)
    
    init() {
        super.init(radius: 0.03, planetName: Planets.mars)
        
        self.position = SCNVector3(x: 0.8, y: 0, z: 0)
        self.rotateObject(rotation: 0.2, duration: 0.4)
        ring.rotateObject(rotation: 0.2, duration: 1)
        ring.addChildNode(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planet() -> SCNNode {
        return ring
    }
}
