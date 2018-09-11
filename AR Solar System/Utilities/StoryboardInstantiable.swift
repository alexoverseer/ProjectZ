import UIKit

protocol StoryboardInstantiable {
    static var storyboardName: String { get }
}

extension StoryboardInstantiable {
    static func instantiate() -> Self {
        guard let controller = storyBoard.instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("Could not instantiate \(Self.self) from storyboard file.")
        }
        return controller
    }

    private static var identifier: String {
        return String(describing: Self.self)
    }

    private static var storyBoard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: nil)
    }
}
