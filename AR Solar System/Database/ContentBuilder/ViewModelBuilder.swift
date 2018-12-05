import UIKit

final class ViewModelBuilder: NSObject {
    
    static let `default` = ViewModelBuilder()
    
    private let navigationRepository = DefaultNavigationRepository()
    private let factsRespository = DefaultFactsRepository()
    
    func buildNavigationByIdentifier(identifier: String) -> Navigation? {
        return navigationRepository.getBy(identifier: identifier)
    }
    
    func buildPlanetFacts(identifier: String) -> [PlanetFact] {
        let facts = factsRespository.getPlanetsBy(identifier: identifier)
        return facts
    }
}
