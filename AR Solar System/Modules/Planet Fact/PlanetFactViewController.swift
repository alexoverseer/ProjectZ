import UIKit

class PlanetFactViewController: UIViewController, StoryboardInstantiable {
    
    static let storyboardName = "PlanetFactViewController"
    
    var interactor: PlanetFactOutput!

    @IBOutlet weak var factsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.onViewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
    }
}

extension PlanetFactViewController: PlanetFactInput {
    
    func setTitle(title: String) {
        self.title = title
    }
    
    func reloadData() {
        factsTableView.reloadData()
    }
}
