import UIKit
import Reusable

class FactTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var factOrderLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    
    func setupCell(with fact: PlanetFact, factOrder: Int) {
        factOrderLabel.text = "Fact #\(factOrder)"
        self.factLabel.text = fact.fact
    }
}
