import ARKit

class Ring: SCNNode {

    init(ringSize: CGFloat, pipeRadius: CGFloat = 0.002) {
        super.init()
        
        let ringMaterial = SCNMaterial()
        ringMaterial.diffuse.contents = UIColor.darkGray
        
        let ring = SCNTorus(ringRadius: ringSize, pipeRadius: pipeRadius)
        ring.materials = [ringMaterial]
        
        self.geometry = ring
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
