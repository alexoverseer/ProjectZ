import Foundation

protocol SpaceManListOutput {
    var peopleInSpaceRightNow: PeopleInSpaceRightNow? { get }
    func viewDidLoad()
    func getCosmonautDetails(at indexPath: Int)
}
