import Foundation

protocol SpaceManDetailsInput: class {
    
}

protocol SpaceManDetailsOutput {
    var spaceMan: SpaceMan { get }
}

final class SpaceManDetailsInteractor: SpaceManDetailsOutput {
    weak var view: SpaceManDetailsInput?
    let spaceMan: SpaceMan
    
    init(spaceMan: SpaceMan) {
        self.spaceMan = spaceMan
    }
}
