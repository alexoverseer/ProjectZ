protocol SolarSystemOutput {
    var planetOptions: [PlanetCategory] { get }
    func viewDidLoad()
    func setNewPlanetType(for index: Int)
}
