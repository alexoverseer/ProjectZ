import Foundation

protocol PlanetFactOutput {
    func onViewDidLoad()
    func numberOfCells() -> Int
    func planetFact(for index: Int) -> PlanetFact?
}
