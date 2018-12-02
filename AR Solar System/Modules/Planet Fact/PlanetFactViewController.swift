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
        factsTableView.tableFooterView = UIView()
        factsTableView.register(cellType: FactTableViewCell.self)
    }
}

extension PlanetFactViewController: PlanetFactInput {
    
    func setTitle(title: String) {
        self.title = "\(title) facts"
    }
    
    func reloadData() {
        factsTableView.reloadData()
    }
}

extension PlanetFactViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.interactor.numberOfCells()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: FactTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        if let fact = self.interactor.planetFact(for: indexPath.row) {
            let order = indexPath.row + 1
            cell.setupCell(with: fact, factOrder: order)
        }
        
        return cell
    }
}
