import Foundation

final class DefaultNavigationRepository: NSObject, NavigationRepository {
    
    let appCache = ApplicationCache.inappCache
    
    func getAll() -> [Navigation] {
        return appCache.navigation
    }
    
    func getBy(identifier: String) -> Navigation? {
        let all = getAll()
        return all.first(where: { $0.identifier == identifier })
    }
}
