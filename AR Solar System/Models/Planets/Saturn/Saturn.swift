import Foundation
import ARKit

class Saturn: Planet {
    
    let ring = Ring(ringSize: 1.25)
    
    init(radius: CGFloat = 0.1, rotationSpeed: Float = 0.4, moons: [Planet]? = nil) {
        super.init(radius: radius, planetName: Planets.saturn.rawValue)
        
        self.position = SCNVector3(x: 1.25, y: 0, z: 0)
        self.rotateObject(rotation: 0.34, duration: rotationSpeed)
        ring.rotateObject(rotation: 0.34, duration: 1)
        ring.addChildNode(self)
        addLoops(width: radius * 5)
        
        guard let saturnMoons = moons else { return }
        _ = saturnMoons.map { self.addChildNode($0) }
    }
    
    private func addLoops(width: CGFloat) {
        
        let saturnLoop = SCNBox(width: width, height: 0, length: width, chamferRadius: 0)
        let saturnLoopMaterial = SCNMaterial()
        saturnLoopMaterial.diffuse.contents = #imageLiteral(resourceName: "Saturn_loop")
        saturnLoop.materials = [saturnLoopMaterial]
        
        let loopNode = SCNNode(geometry: saturnLoop)
        loopNode.position = SCNVector3(x: 0, y: 0, z: 0)
        loopNode.rotation = SCNVector4(x: -0.5, y: -0.5, z: 0, w: 5)
        self.addChildNode(loopNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func planetWithRing() -> SCNNode {
        return ring
    }
}
