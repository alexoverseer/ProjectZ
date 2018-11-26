import UIKit

final class ViewModelBuilder: NSObject {
    
    static let `default` = ViewModelBuilder()
    
    let appCache = ApplicationCache.inappCache
    
    private let navigationRepository = DefaultNavigationRepository()
    
    func buildNavigationModels() -> [Navigation] {
        let navigationModels = navigationRepository.getAll()
        return navigationModels
    }
    
    func buildNavigationByIdentifier(identifier: String) -> Navigation? {
        return navigationRepository.getBy(identifier: identifier)
    }
}
