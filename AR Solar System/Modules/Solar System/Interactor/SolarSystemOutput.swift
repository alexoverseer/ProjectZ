import ARKit

protocol SolarSystemOutput {
    
    var planetOptions: [PlanetCategory] { get }
    var selectedOption: PlanetCategory { get }
    var selectedPlanetIdentifier: String { get }
    
    func viewDidLoad()
    func setNewPlanetType(for index: Int)
    
    func registerARSCNView(view: ARSCNView)
    func prepareRecorder(configuration: ARWorldTrackingConfiguration)
    func stopRecorder()
    func recordGIF()
    func recordLivePhoto()
}
