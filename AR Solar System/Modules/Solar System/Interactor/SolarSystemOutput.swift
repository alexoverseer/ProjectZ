protocol SolarSystemOutput {
    var planetOptions: [PlanetCategory] { get }
    var selectedOption: PlanetCategory { get }
    func viewDidLoad()
    func setNewPlanetType(for index: Int)
}
