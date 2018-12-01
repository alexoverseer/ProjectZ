protocol SolarSystemOutput {
    var planetOptions: [PlanetCategory] { get }
    var selectedOption: PlanetCategory { get }
    var selectedPlanetIdentifier: String { get }
    func viewDidLoad()
    func setNewPlanetType(for index: Int)
}
