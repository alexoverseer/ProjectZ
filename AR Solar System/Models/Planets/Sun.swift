import Foundation
import ARKit

class Sun: Planet {
    
    init() {
        super.init(radius: 0.25, planetName: Planets.sun)
        self.position = SCNVector3(x: 0, y: 0, z: 0)
        self.rotateObject(rotation: -0.3, duration: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
