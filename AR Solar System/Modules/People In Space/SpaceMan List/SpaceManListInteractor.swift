import Foundation

protocol SpaceManListInput: class {
    func reloadData()
    func showCosmonautDetails(spaceMan: SpaceMan)
    func onError(_ error: ErrorType)
}

protocol SpaceManListOutput {
    var peopleInSpaceRightNow: PeopleInSpaceRightNow? { get }
    func viewDidLoad()
    func getCosmonautDetails(at indexPath: Int)
}

final class SpaceManListInteractor: SpaceManListOutput {
    
    weak var view: SpaceManListInput?
    var peopleInSpaceRightNow: PeopleInSpaceRightNow?

    let spacePeopleAPI: SpacePeopleProtocol
    
    init(api service: SpacePeopleProtocol = SpacePeopleService()) {
        self.spacePeopleAPI = service
    }
    
    func viewDidLoad() {
        spacePeopleAPI.requestSpacePeopleDetails(onSuccess: { [weak self] people in
            self?.peopleInSpaceRightNow = people
            self?.view?.reloadData()
        }, onFailure: { [weak self] error in
            self?.view?.onError(error)
        })
    }
    
    func getCosmonautDetails(at indexPath: Int) {
        guard let cosmonaut = peopleInSpaceRightNow?.people[indexPath] else { return }
        view?.showCosmonautDetails(spaceMan: cosmonaut)
    }
}
