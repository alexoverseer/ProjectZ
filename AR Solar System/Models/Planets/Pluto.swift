import Foundation
import ARKit

class Pluto: Planet {
    
    let ring = Ring(ringSize: 2)
    
    init() {
        super.init(radius: 0.02, planetName: Planets.pluto)
        
        self.position = SCNVector3(x: 2, y: 0, z: 0)
        self.rotateObject(rotation: 0.1, duration: 0.4)
        ring.rotateObject(rotation: 0.1, duration: 1)
        ring.addChildNode(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planet() -> SCNNode {
        return ring
    }
}
