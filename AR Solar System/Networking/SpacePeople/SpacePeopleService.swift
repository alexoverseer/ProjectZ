import Foundation

protocol SpacePeopleService {
    func requestSpacePeopleDetails(onSuccess: @escaping (PeopleInSpaceRightNow) -> Void,
                                   onFailure: @escaping (ErrorType) -> Void)
}
