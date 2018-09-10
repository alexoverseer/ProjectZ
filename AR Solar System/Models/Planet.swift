import ARKit

enum Planets: String {
    case sun = "Sun"
    case mercury = "Mercury"
    case venus = "Venus"
    case earth = "Earth"
    case moon = "Moon"
    case mars = "Mars"
    case jupiter = "Jupiter"
    case saturn = "Saturn"
    case uranus = "Uranus"
    case neptune = "Neptune"
    case pluto = "Pluto"
}

class Planet: SCNNode {
    
    init(radius: CGFloat, planetName: Planets) {
        super.init()
        
        let planet = SCNSphere(radius: radius)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "\(planetName.rawValue).jpg")
        planet.materials = [material]
        
        self.geometry = planet
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func planet() -> SCNNode {
        return self
    }
}
