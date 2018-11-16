import Foundation

protocol SpacePeopleProtocol {
    func requestSpacePeopleDetails(onSuccess: @escaping (PeopleInSpaceRightNow) -> Void,
                                   onFailure: @escaping (ErrorType) -> Void)
}
