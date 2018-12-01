import UIKit

final class ViewModelBuilder: NSObject {
    
    static let `default` = ViewModelBuilder()
    
    let appCache = ApplicationCache.inappCache
    
    private let navigationRepository = DefaultNavigationRepository()
    private let factsRespository = DefaultFactsRepository()
    
    // MARK: - Navigation
    
    func buildNavigationModels() -> [Navigation] {
        let navigationModels = navigationRepository.getAll()
        return navigationModels
    }
    
    func buildNavigationByIdentifier(identifier: String) -> Navigation? {
        return navigationRepository.getBy(identifier: identifier)
    }
    
    // MARK: - Facts
    
    func buildPlanetsFacts() -> [PlanetFact] {
        let factsModels = factsRespository.getAll()
        return factsModels
    }
    
    func buildPlanetFacts(identifier: String) -> [PlanetFact] {
        let facts = factsRespository.getPlanetsBy(identifier: identifier)
        return facts
    }
}
