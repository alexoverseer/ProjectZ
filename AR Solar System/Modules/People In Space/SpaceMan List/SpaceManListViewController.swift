import UIKit
import ARKit

final class SpaceManListViewController: UIViewController, StoryboardInstantiable {
    
    static let storyboardName = "SpaceManListViewController"
    
    var interactor: SpaceManListOutput!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private functions
    
    func setupUI() {
        
    }
}

extension SpaceManListViewController: SpaceManListInput {
    
    func didRetrieveSpacePeople(_ peopleInSpaceRightNow: PeopleInSpaceRightNow) {
        print(peopleInSpaceRightNow.number)
    }
    
    func onError(_ error: ErrorType) {
        
    }
}
