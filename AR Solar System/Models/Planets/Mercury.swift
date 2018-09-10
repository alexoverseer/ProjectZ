import Foundation
import ARKit

class Mercury: Planet {
    
    var ring = Ring(ringSize: 0.3)
    
    init() {
        super.init(radius: 0.03, planetName: Planets.mercury)
        
        self.position = SCNVector3(x: 0.3, y: 0, z: 0)
        self.rotateObject(rotation: 0.6, duration: 0.4)
        ring.rotateObject(rotation: 0.6, duration: 1)
        ring.addChildNode(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planet() -> SCNNode {
        return ring
    }
}
