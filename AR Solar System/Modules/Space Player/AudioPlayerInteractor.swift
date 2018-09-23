import Foundation

protocol AudioPlayerInput: class {
    func showTrackName(trackName: String)
}

protocol AudioPlayerOutput {
    func viewDidLoad()
}

final class AudioPlayerInteractor: AudioPlayerOutput, AudioPlayerDelegate {
    
    weak var view: AudioPlayerInput?
    
    func viewDidLoad() {
        AudioPlayer.shared.delegate = self
        view?.showTrackName(trackName: AudioPlayer.shared.currentTrackName())
    }

    // MARK: - AudioPlayerDelegate
    
    func audioPlayerDidChangeTrack(trackName: String) {
        DispatchQueue.main.async {
            self.view?.showTrackName(trackName: trackName)
        }
    }
}
