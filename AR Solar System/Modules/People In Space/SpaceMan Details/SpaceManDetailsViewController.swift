import UIKit

final class SpaceManDetailsViewController: UIViewController, StoryboardInstantiable {

    static let storyboardName = "SpaceManDetailsViewController"
    
    var interactor: SpaceManDetailsOutput!
    
    @IBOutlet weak var cosmonautImageView: UIImageView!
    @IBOutlet weak var bioImageActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cosmonautNameLabel: UILabel!
    @IBOutlet weak var cosmonautCountryFlagImageView: UIImageView!
    @IBOutlet weak var comsmonautLaunchDayLabel: UILabel!
    @IBOutlet weak var comsmonautCareerDaysLabel: UILabel!
    @IBOutlet weak var cosmonautTitleLabel: UILabel!
    @IBOutlet weak var cosmonautLocationLabel: UILabel!
    @IBOutlet weak var cosmonautBioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private functions
    
    private func setupUI() {
        cosmonautNameLabel.text = interactor.spaceMan.name
        comsmonautLaunchDayLabel.text = interactor.spaceMan.launchdate
        comsmonautCareerDaysLabel.text = "\(interactor.spaceMan.careerdays) careers days"
        cosmonautTitleLabel.text = interactor.spaceMan.title
        cosmonautLocationLabel.text = interactor.spaceMan.location
        cosmonautBioLabel.text = interactor.spaceMan.bio
        loadImages()
    }
    
    private func loadImages() {
        SharedImageDownloader.shared.fetchImage(with: interactor.spaceMan.countryflag) { [weak self] image in
            if let downloadedImage = image {
                self?.cosmonautCountryFlagImageView.image = downloadedImage
            }
        }
        SharedImageDownloader.shared.fetchImage(with: interactor.spaceMan.biophoto) { [weak self] image in
            if let downloadedImage = image {
                self?.cosmonautImageView.image = downloadedImage
                self?.bioImageActivityIndicator.stopAnimating()
            }
        }
    }
    
    @IBAction func showTwitterAccount() {
        openURL(stringURL: interactor.spaceMan.twitter)
    }
    
    @IBAction func showWikipediaPage() {
        openURL(stringURL: interactor.spaceMan.biolink)
    }
}

extension SpaceManDetailsViewController: SpaceManDetailsInput {
    
}
