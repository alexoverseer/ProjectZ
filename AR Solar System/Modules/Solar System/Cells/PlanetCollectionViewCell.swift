import UIKit

final class PlanetCollectionViewCell: UICollectionViewCell {

    static let identifier = "PlanetCollectionViewCell"
    
    @IBOutlet private weak var planetNameLabel: UILabel!
    @IBOutlet private weak var blureView: UIVisualEffectView!
    
    func populate(with option: PlanetCategory) {
        planetNameLabel.text = option.title
        blureView.effect = option.isSelected ? UIBlurEffect(style: .light) : UIBlurEffect(style: .dark)
    }
}
