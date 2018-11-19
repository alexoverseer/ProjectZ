import Foundation
import ARKit

class Uranus: Planet {
    
    let ring = Ring(ringSize: 1.5)
    
    init() {
        super.init(radius: 0.07, planetName: Planets.uranus.rawValue)
        
        self.position = SCNVector3(x: 1.5, y: 0, z: 0)
        self.rotateObject(rotation: 0.25, duration: 0.4)
        ring.rotateObject(rotation: 0.25, duration: 1)
        ring.addChildNode(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planetWithRing() -> SCNNode {
        return ring
    }
}
