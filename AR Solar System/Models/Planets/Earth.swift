import Foundation
import ARKit

class Earth: Planet {
    
    var ring = Ring(ringSize: 0.7)
    
    init() {
        super.init(radius: 0.05, planetName: Planets.earth)
        
        self.position = SCNVector3(x: 0.7, y: 0, z: 0)
        self.rotateObject(rotation: 0.25, duration: 0.4)
        ring.rotateObject(rotation: 0.25, duration: 1)
        ring.addChildNode(self)
        
        addMoon()
    }
    
    private func addMoon() {
        let moon = Moon()
        self.addChildNode(moon)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planet() -> SCNNode {
        return ring
    }
}
