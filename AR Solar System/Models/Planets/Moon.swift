import Foundation
import ARKit

class Moon: Planet {
    
    var ring = Ring(ringSize: 0.08, pipeRadius: 0.000_001)
    
    init(radius: CGFloat = 0.01, offset: Float = 0.08) {
        super.init(radius: radius, planetName: Planets.moon)
        
        self.position = SCNVector3(x: offset, y: 0, z: 0)
        ring.position = SCNVector3(x: 0, y: 0.02, z: 0)
        ring.addChildNode(self)
        self.addChildNode(ring)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planetWithRing() -> SCNNode {
        return ring
    }
}
