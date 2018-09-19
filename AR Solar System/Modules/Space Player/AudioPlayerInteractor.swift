import Foundation

protocol AudioPlayerInput: class {
    
}

protocol AudioPlayerOutput {
    
}

final class AudioPlayerInteractor: AudioPlayerOutput {
    
    weak var view: AudioPlayerInput?

}
