import UIKit

class CosmonautTableViewCell: UITableViewCell {

    static let identifier = "CosmonautTableViewCell"
    
    @IBOutlet weak var comsmonautNameLabel: UILabel!
    @IBOutlet weak var comsmonautCountryFlagImageView: UIImageView!
    @IBOutlet weak var comsmonautLaunchDayLabel: UILabel!
    
    func populate(with spaceMan: SpaceMan) {
        comsmonautNameLabel.text = spaceMan.name
        comsmonautLaunchDayLabel.text = spaceMan.launchdate
        SharedImageDownloader.shared.fetchImage(with: spaceMan.countryflag) { [weak self] image in
            if let downloadedImage = image {
                self?.comsmonautCountryFlagImageView.image = downloadedImage
            }
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        UIView.animate(withDuration: 0.1) {
            if highlighted {
                self.comsmonautNameLabel.textColor = UIColor.darkGray
            } else {
                self.comsmonautNameLabel.textColor = UIColor.white
            }
        }
    }
}
