import Foundation

final class DefaultFactsRepository: NSObject, FactsRepository {
    
    let appCache = ApplicationCache.inappCache
    
    func getAll() -> [PlanetFact] {
        return appCache.planetFacts
    }
    
    func getBy(identifier: String) -> PlanetFact? {
        let all = getAll()
        return all.first(where: { $0.identifier == identifier })
    }
    
    func getPlanetsBy(identifier: String) -> [PlanetFact] {
        let all = getAll()
        return all.filter { $0.identifier == identifier }
    }
}
