import Foundation
import ARKit

class Venus: Planet {
    
    var ring = Ring(ringSize: 0.5)
    
    init() {
        super.init(radius: 0.04, planetName: Planets.venus)
        
        self.position = SCNVector3(x: 0.5, y: 0, z: 0)
        self.rotateObject(rotation: 0.4, duration: 0.4)
        ring.rotateObject(rotation: 0.4, duration: 1)
        ring.addChildNode(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planet() -> SCNNode {
        return ring
    }
}
