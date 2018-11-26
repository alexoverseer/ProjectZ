import UIKit

final class PlanetDistanceViewController: UIViewController, StoryboardInstantiable {

    static let storyboardName = "PlanetDistanceViewController"
    var interactor: PlanetDistanceOutput!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var distanceTitleLabel: UILabel!
    @IBOutlet weak var diameterLabel: UILabel!
    @IBOutlet weak var diameterTitleLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var areaTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.onViewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func closeModule() {
        dismiss(animated: true, completion: nil)
    }
}

extension PlanetDistanceViewController: PlanetDistanceInput {
    
    func setupUI(option: PlanetOption) {
        let planetName = option.name
        distanceTitleLabel.text = "Distance to \(planetName)"
        diameterTitleLabel.text = "Diameter of \(planetName)"
            areaTitleLabel.text = "Area of \(planetName)"
    }
    
    func setNavigationInfo(model: Navigation?) {
        self.distanceLabel.text = model?.distance
        self.diameterLabel.text = model?.diameter
        self.areaLabel.text = model?.area
    }
}
