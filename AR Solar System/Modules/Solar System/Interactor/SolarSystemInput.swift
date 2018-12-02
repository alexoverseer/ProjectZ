import ARKit
import Photos

protocol SolarSystemInput: class {
    func setupSceneView(with node: SCNNode)
    func exportMessage(success: Bool, status: PHAuthorizationStatus)
}
