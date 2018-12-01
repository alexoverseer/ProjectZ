import UIKit

final class ApplicationCache: NSObject {
    
    static let inappCache = ApplicationCache()
    private let decoder = Decoder.default
    public let navigation: [Navigation]
    public let planetFacts: [PlanetFact]

    override init() {
        self.navigation = decoder.transformJSON(fileName: "navigation") ?? []
        self.planetFacts = decoder.transformJSON(fileName: "facts") ?? []
    }
}
