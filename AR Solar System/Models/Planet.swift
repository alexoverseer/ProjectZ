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

enum JupiterMoons: String {
    case ioMoon = "Io"
    case europa = "Europa"
    case genymede = "Genymede"
    case callisto = "Callisto"
}

enum SaturnMoons: String {
    case dione = "Dione"
    case enceladus = "Enceladus"
    case mimas = "Mimas"
    case rhea = "Rhea"
    case tethys = "Tethys"
}

enum UranusMoons: String {
    case ariel = "Ariel"
    case miranda = "Miranda"
    case oberon = "Oberon"
    case titania = "Titania"
    case umbriel = "Umbriel"
}

enum NeptuneMoons: String {
    case triton = "Triton"
}

enum PlutoMoons: String {
    case charon = "Charon"
}

class Planet: SCNNode {
    
    init(radius: CGFloat, planetName: String) {
        super.init()
        
        let planet = SCNSphere(radius: radius)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "\(planetName).jpg")
        planet.materials = [material]
        
        self.geometry = planet
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func planet() -> SCNNode {
        return self
    }
    
    func planetWithRing() -> SCNNode {
        return self
    }
}
