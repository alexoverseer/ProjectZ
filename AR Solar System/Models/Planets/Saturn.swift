import Foundation
import ARKit

class Saturn: Planet {
    
    let ring = Ring(ringSize: 1.25)
    
    init() {
        super.init(radius: 0.09, planetName: Planets.saturn)
        
        self.position = SCNVector3(x: 1.25, y: 0, z: 0)
        self.rotateObject(rotation: 0.34, duration: 0.4)
        ring.rotateObject(rotation: 0.34, duration: 1)
        ring.addChildNode(self)
        addLoops()
    }
    
    private func addLoops() {
        
        let saturnLoop = SCNBox(width: 0.4, height: 0, length: 0.5, chamferRadius: 0)
        let saturnLoopMaterial = SCNMaterial()
        saturnLoopMaterial.diffuse.contents = #imageLiteral(resourceName: "Saturn_loop")
        saturnLoop.materials = [saturnLoopMaterial]
        
        let loopNode = SCNNode(geometry: saturnLoop)
        loopNode.position = SCNVector3(x: 0, y: 0, z: 0)
        loopNode.rotation = SCNVector4(x: -0.5, y: -0.5, z: 0, w:5)
        self.addChildNode(loopNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planetWithRing() -> SCNNode {
        return ring
    }
}
