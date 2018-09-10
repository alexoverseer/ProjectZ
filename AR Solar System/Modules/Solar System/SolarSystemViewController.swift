import UIKit
import SceneKit
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

class SolarSystemViewController: UIViewController {
    
    @IBOutlet var sceneView: ARSCNView!
    
    let baseNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScene()
        
        baseNode.position = SCNVector3(x: 0, y: -0.5, z: -1)
        
        //Sun ---------------------------------------------------------------
        let sun = createPlanet(radius: 0.25, imageName: Planets.sun.rawValue)
        sun.position = SCNVector3(x: 0, y: 0, z: 0)
        sun.rotateObject(rotation: -0.3, duration: 1)
        baseNode.addChildNode(sun)
        
        //Mercury ---------------------------------------------------------------
        let mercuryRing = createRing(ringSize: 0.3)
        let mercury = createPlanet(radius: 0.03, imageName: Planets.mercury.rawValue)
        mercury.position = SCNVector3(x: 0.3, y: 0, z: 0)
        mercury.rotateObject(rotation: 0.6, duration: 0.4)
        mercuryRing.rotateObject(rotation: 0.6, duration: 1)
        mercuryRing.addChildNode(mercury)
        baseNode.addChildNode(mercuryRing)
        
        //Venus ---------------------------------------------------------------
        let venusRing = createRing(ringSize: 0.5)
        let venus = createPlanet(radius: 0.04, imageName: Planets.venus.rawValue)
        venus.position = SCNVector3(x: 0.5, y: 0, z: 0)
        venus.rotateObject(rotation: 0.4, duration: 0.4)
        venusRing.rotateObject(rotation: 0.4, duration: 1)
        venusRing.addChildNode(venus)
        baseNode.addChildNode(venusRing)
        
        //Earth ---------------------------------------------------------------
        let earthRing = createRing(ringSize: 0.7)
        let earth = createPlanet(radius: 0.05, imageName: Planets.earth.rawValue)
        earth.position = SCNVector3(x: 0.7, y: 0, z: 0)
        earth.rotateObject(rotation: 0.25, duration: 0.4)
        earthRing.rotateObject(rotation: 0.25, duration: 1)
        earthRing.addChildNode(earth)
        baseNode.addChildNode(earthRing)
        
        //Moon ---------------------------------------------------------------
        let moonRing = createRing(ringSize: 0.08, pipeRadius: 0.000001)
        let moon = createPlanet(radius: 0.01, imageName: Planets.moon.rawValue)
        moon.position = SCNVector3(x: 0.08, y: 0, z: 0)
        moonRing.position = SCNVector3(x: 0, y: 0.02, z: 0)
        moonRing.addChildNode(moon)
        earth.addChildNode(moonRing)
        
        //Mars ---------------------------------------------------------------
        let marsRing = createRing(ringSize: 0.8)
        let mars = createPlanet(radius: 0.03, imageName: Planets.mars.rawValue)
        mars.position = SCNVector3(x: 0.8, y: 0, z: 0)
        mars.rotateObject(rotation: 0.2, duration: 0.4)
        marsRing.rotateObject(rotation: 0.2, duration: 1)
        marsRing.addChildNode(mars)
        baseNode.addChildNode(marsRing)
        
        //Jupiter ---------------------------------------------------------------
        let jupiterRing = createRing(ringSize: 1)
        let jupiter = createPlanet(radius: 0.12, imageName: Planets.jupiter.rawValue)
        jupiter.position = SCNVector3(x: 1, y: 0, z: 0)
        jupiter.rotateObject(rotation: 0.45, duration: 0.4)
        jupiterRing.rotateObject(rotation: 0.45, duration: 1)
        jupiterRing.addChildNode(jupiter)
        baseNode.addChildNode(jupiterRing)
        
        //Saturn ---------------------------------------------------------------
        let saturnRing = createRing(ringSize: 1.25)
        let saturn = createPlanet(radius: 0.09, imageName: Planets.saturn.rawValue)
        saturn.position = SCNVector3(x: 1.25, y: 0, z: 0)
        saturn.rotateObject(rotation: 0.34, duration: 0.4)
        saturnRing.rotateObject(rotation: 0.34, duration: 1)
        saturnRing.addChildNode(saturn)
        baseNode.addChildNode(saturnRing)
        
        //Saturn Loops ---------------------------------------------------------------
        let saturnLoop = SCNBox(width: 0.4, height: 0, length: 0.5, chamferRadius: 0)
        let saturnLoopMaterial = SCNMaterial()
        saturnLoopMaterial.diffuse.contents = #imageLiteral(resourceName: "Saturn_loop")
        saturnLoop.materials = [saturnLoopMaterial]
        
        let loopNode = SCNNode(geometry: saturnLoop)
        loopNode.position = SCNVector3(x: 0, y: 0, z: 0)
        loopNode.rotation = SCNVector4(x: -0.5, y: -0.5, z: 0, w:5)
        saturn.addChildNode(loopNode)
        
        //Uranus ---------------------------------------------------------------
        let uranusRing = createRing(ringSize: 1.5)
        let uranus = createPlanet(radius: 0.07, imageName: Planets.uranus.rawValue)
        uranus.position = SCNVector3(x: 1.5, y: 0, z: 0)
        uranus.rotateObject(rotation: 0.25, duration: 0.4)
        uranusRing.rotateObject(rotation: 0.25, duration: 1)
        uranusRing.addChildNode(uranus)
        baseNode.addChildNode(uranusRing)
        
        //Neptune ---------------------------------------------------------------
        let neptuneRing = createRing(ringSize: 1.7)
        let neptune = createPlanet(radius: 0.08, imageName: Planets.neptune.rawValue)
        neptune.position = SCNVector3(x: 1.7, y: 0, z: 0)
        neptune.rotateObject(rotation: 0.2, duration: 0.4)
        neptuneRing.rotateObject(rotation: 0.2, duration: 1)
        neptuneRing.addChildNode(neptune)
        baseNode.addChildNode(neptuneRing)
        
        //Pluto ---------------------------------------------------------------
        let plutoRing = createRing(ringSize: 2)
        let pluto = createPlanet(radius: 0.02, imageName: Planets.pluto.rawValue)
        pluto.position = SCNVector3(x: 2, y: 0, z: 0)
        pluto.rotateObject(rotation: 0.1, duration: 0.4)
        plutoRing.rotateObject(rotation: 0.1, duration: 1)
        plutoRing.addChildNode(pluto)
        baseNode.addChildNode(plutoRing)
        
        
        sceneView.scene.rootNode.addChildNode(baseNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    // MARK: - Initialization
    
    func setupScene() {
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    // MARK: - Builders
    
    func createPlanet(radius: CGFloat, imageName: String) -> SCNNode {
        let planet = SCNSphere(radius: radius)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "\(imageName).jpg")
        planet.materials = [material]
        
        return SCNNode(geometry: planet)
    }
    
    func createRing(ringSize: Float, pipeRadius: CGFloat = 0.002) -> SCNNode {
        let ringMaterial = SCNMaterial()
        ringMaterial.diffuse.contents = UIColor.darkGray
        
        let ring = SCNTorus(ringRadius: CGFloat(ringSize), pipeRadius: pipeRadius)
        ring.materials = [ringMaterial]
        
        return SCNNode(geometry: ring)
    }
}

extension SolarSystemViewController: ARSCNViewDelegate {
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        DispatchQueue.main.async {
            let okAction = AlertAction(onSelect: {}, name: "OK", style: .default)
            let alert = UIAlertController(info: AlertInfo(title: "Error", message: error.localizedDescription, actions: [okAction]))
            self.present(alert, animated: true)
        }
    }
}
