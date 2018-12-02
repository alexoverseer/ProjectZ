import UIKit
import SceneKit
import ARKit
import Photos

final class SolarSystemViewController: UIViewController, StoryboardInstantiable {
    
    static let storyboardName = "SolarSystemViewController"
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var planetsCollectionView: UICollectionView!
    
    var interactor: SolarSystemOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.viewDidLoad()
        setupScene()
        setupUI()
        AudioPlayer.shared.play()
        interactor.registerARSCNView(view: sceneView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        interactor.prepareRecorder(configuration: configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
        interactor.stopRecorder()
    }
    
    // MARK: - Private functions
    
    private func setupScene() {
        sceneView.delegate = self
        sceneView.showsStatistics = false
        
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    private func setupUI() {
        planetsCollectionView?.register(cellType: PlanetCollectionViewCell.self)
    }
}

extension SolarSystemViewController: SolarSystemInput {
    
    func setupSceneView(with node: SCNNode) {
        DispatchQueue.main.async {
            _ = self.sceneView.scene.rootNode.childNodes.map { $0.removeFromParentNode() }
            self.sceneView.scene.rootNode.addChildNode(node)
        }
    }
    
    func exportMessage(success: Bool, status: PHAuthorizationStatus) {
        
        if success {
            showAlert(with: "Successful Export",
                      alertMessage: "Media exported to camera roll successfully!")
        } else if status == .denied || status == .restricted || status == .notDetermined {
            
            let cancelAction = AlertAction(name: "Cancel", action: {})
            let settingsAction = AlertAction(name: "Open Settings", action: {
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: nil)
                }
            }, style: .cancel)
            let errorMessage = "Please allow access to the photo library in order to save this media file."
            let alert = UIAlertController(info: AlertInfo(title: title,
                                                          message: errorMessage,
                                                          actions: [settingsAction, cancelAction]))
            self.present(alert, animated: true)
            
        } else {
            showAlert(with: "Failed Export",
                      alertMessage: "Media exported to camera roll successfully!")
        }
    }
}

extension SolarSystemViewController: ARSCNViewDelegate {
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.showAlert(with: "Error", alertMessage: error.localizedDescription)
        }
    }
}
