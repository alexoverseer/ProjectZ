import UIKit
import Reusable

final class PlanetCollectionViewCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet private weak var planetNameLabel: UILabel!
    @IBOutlet private weak var blureView: UIVisualEffectView!
    
    func populate(with option: PlanetCategory) {
        planetNameLabel.text = option.title
        blureView.effect = option.isSelected ? UIBlurEffect(style: .light) : UIBlurEffect(style: .dark)
    }
}
