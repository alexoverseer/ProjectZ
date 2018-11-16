import Foundation

protocol SpaceManListInput: class {
    func reloadData()
    func showCosmonautDetails(spaceMan: SpaceMan)
    func onError(_ error: ErrorType)
}
