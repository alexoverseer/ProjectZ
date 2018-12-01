import Foundation

protocol FactsRepository: Repository {
 
    func getPlanetsBy(identifier: String) -> [PlanetFact]
}
