import Foundation

protocol SpaceManListInput: class {
    func didRetrieveSpacePeople(_ peopleInSpaceRightNow: PeopleInSpaceRightNow)
    func onError(_ error: ErrorType)
}

protocol SpaceManListOutput {
    func viewDidLoad()
}

final class SpaceManListInteractor: SpaceManListOutput {
    
    weak var view: SpaceManListInput?

    let spacePeopleAPI: SpacePeopleProtocol
    
    init(api service: SpacePeopleProtocol = SpacePeopleService()) {
        self.spacePeopleAPI = service
    }
    
    func viewDidLoad() {
        spacePeopleAPI.requestSpacePeopleDetails(onSuccess: { [weak self] people in
            self?.view?.didRetrieveSpacePeople(people)
        }, onFailure: { [weak self] error in
            self?.view?.onError(error)
        })
    }
}
