import Foundation
import ARKit

class Dione: Planet {
    
    var ring = Ring(ringSize: 0.5)
    
    init(radius: CGFloat = 0.05, rotationSpeed: Float = 0.4) {
        super.init(radius: radius, planetName: SaturnMoons.dione.rawValue)
        
        self.position = SCNVector3(x: 0.5, y: 0, z: 0)
        self.rotateObject(rotation: 1, duration: rotationSpeed)
        ring.addChildNode(self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planetWithRing() -> SCNNode {
        
        return ring
    }
}
