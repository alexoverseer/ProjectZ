import UIKit
import SceneKit
import ARKit

class SolarSystemViewController: UIViewController {
    
    @IBOutlet var sceneView: ARSCNView!
    
    let baseNode = SCNNode()
    let planets = [Sun(), Mercury(), Venus(), Earth(), Mars(), Jupiter(), Saturn(), Uranus(), Neptune(), Pluto()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScene()
        setupBaseNode()
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
    
    // MARK: - Private functions
    
    func setupScene() {
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    func setupBaseNode() {
        baseNode.position = SCNVector3(x: 0, y: -0.5, z: -1)
        _ = planets.map { baseNode.addChildNode($0.planet()) }
        sceneView.scene.rootNode.addChildNode(baseNode)
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
