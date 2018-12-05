import Foundation

final class SpaceManListInteractor: SpaceManListOutput {
    
    weak var view: SpaceManListInput?
    var peopleInSpaceRightNow: PeopleInSpaceRightNow?

    let spacePeopleService: SpacePeopleService
    
    init(api service: SpacePeopleService = DefaultSpacePeopleService()) {
        self.spacePeopleService = service
    }
    
    func viewDidLoad() {
        spacePeopleService.requestSpacePeopleDetails(onSuccess: { [weak self] people in
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
