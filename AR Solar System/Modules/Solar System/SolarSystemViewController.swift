import UIKit
import SceneKit
import ARKit

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
    
    private func setupScene() {
        sceneView.delegate = self
        sceneView.showsStatistics = false
        
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    private func setupUI() {
        planetsCollectionView?.register(cellType: PlanetCollectionViewCell.self)
    }
    
    @IBAction private func showManInSpace() {
        let controller = SpaceManListBuilder.build()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction private func showAudioPlayer() {
        let controller = AudioPlayerBuilder.build()
        present(controller, animated: true, completion: nil)
    }
}

extension SolarSystemViewController: SolarSystemInput {
    
    func setupSceneView(with node: SCNNode) {
        DispatchQueue.main.async {
            _ = self.sceneView.scene.rootNode.childNodes.map { $0.removeFromParentNode() }
            self.sceneView.scene.rootNode.addChildNode(node)
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

extension SolarSystemViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interactor.planetOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PlanetCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        
        let planetOption = interactor.planetOptions[indexPath.row]
        cell.populate(with: planetOption)
        
        return cell
    }
}

extension SolarSystemViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        _ = interactor.planetOptions.map {$0.isSelected = false}
        interactor.planetOptions[indexPath.row].isSelected = true
        interactor.setNewPlanetType(for: indexPath.row)
        planetsCollectionView.reloadData()
        planetsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension SolarSystemViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height - 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
    }
}
