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
        planetsCollectionView.register(UINib(nibName: PlanetCollectionViewCell.identifier, bundle: nil),
                                       forCellWithReuseIdentifier: PlanetCollectionViewCell.identifier)
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
            let okAction = AlertAction(onSelect: {}, name: "OK", style: .default)
            let alert = UIAlertController(info: AlertInfo(title: "Error", message: error.localizedDescription, actions: [okAction]))
            self.present(alert, animated: true)
        }
    }
}

extension SolarSystemViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interactor.planetOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetCollectionViewCell.identifier,
                                                            for: indexPath) as? PlanetCollectionViewCell else {
            fatalError("DequeueReusableCell failed while casting")
        }
        
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

        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}
