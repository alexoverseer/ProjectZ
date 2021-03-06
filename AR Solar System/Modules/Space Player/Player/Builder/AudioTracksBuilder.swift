import Foundation

final class AudioTracksBuilder: TracksBuilder {
    
    private var trackNamesArray: [String] = {
        return ["Floating Drone - Teddy Bergström",
                "The Cosmos - Johannes Bornlöf",
                "Lonely Space Rhodes - Jonas Elander"]
    }()
    
    func build() -> [AudioTrack] {
        return trackNamesArray.map { trackName -> AudioTrack in
            let pathToTrack = Bundle.main.path(forResource: trackName, ofType: "mp3")!
            let trackFileURL = URL(fileURLWithPath: pathToTrack)
            return AudioTrack(trackName: trackName, trackURL: trackFileURL)
            }.shuffled()
    }
}
