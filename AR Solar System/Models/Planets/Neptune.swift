import Foundation
import ARKit

class Neptune: Planet {
    
    let ring = Ring(ringSize: 1.7)
    
    init() {
        super.init(radius: 0.08, planetName: Planets.neptune.rawValue)
        
        self.position = SCNVector3(x: 1.7, y: 0, z: 0)
        self.rotateObject(rotation: 0.2, duration: 0.4)
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
