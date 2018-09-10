import Foundation
import ARKit

class Moon: Planet {
    
    var ring = Ring(ringSize: 0.08, pipeRadius: 0.000001)
    
    init() {
        super.init(radius: 0.01, planetName: Planets.moon)
        
        self.position = SCNVector3(x: 0.08, y: 0, z: 0)
        ring.position = SCNVector3(x: 0, y: 0.02, z: 0)
        ring.addChildNode(self)
        self.addChildNode(ring)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planet() -> SCNNode {
        return ring
    }
}
