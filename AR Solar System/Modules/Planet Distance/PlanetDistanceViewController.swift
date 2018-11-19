import UIKit

final class PlanetDistanceViewController: UIViewController, StoryboardInstantiable {

    static let storyboardName = "PlanetDistanceViewController"
    var interactor: PlanetDistanceOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.onViewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func closeModule() {
        
    }
}

extension PlanetDistanceViewController: PlanetDistanceInput {
    
}
