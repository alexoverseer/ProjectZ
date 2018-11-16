import Foundation

protocol AudioPlayerDelegate: class {
    func audioPlayerDidChangeTrack(trackName: String)
}
