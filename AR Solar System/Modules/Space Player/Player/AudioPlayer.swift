import Foundation
import AVFoundation

class AudioPlayer: NSObject {
    
    static let shared = AudioPlayer()
    weak var delegate: AudioPlayerDelegate?
    
    private var audioPlayer: AVAudioPlayer?
    private var audioTracks: [AudioTrack]
    private var trackIndex = 0
    
    // MARK: Private methods
    
    private init(builder: TracksBuilder = AudioTracksBuilder()) {
        self.audioTracks = builder.build()
        super.init()
        enableAudioSessionObserver()
    }
    
    private func enableAudioSessionObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.handleInterruption(_:)),
                                               name: AVAudioSession.interruptionNotification,
                                               object: AVAudioSession.sharedInstance())
    }
    
    @objc private func handleInterruption(_ notification: Notification) {
        let interruption = notification.userInfo?["AVAudioSessionInterruptionTypeKey"] ?? 0
        if let interruptionType = AVAudioSession.InterruptionType(rawValue: interruption as! UInt) {
            switch interruptionType {
            case .began:
                audioPlayer?.pause()
            case .ended:
                audioPlayer?.play()
            }
        }
    }
    
    // MARK: - Functional
    
    func play() {
        if UserDefaults.standard.backgroundMusicState {
            audioPlayer = try? AVAudioPlayer.init(contentsOf: audioTracks[trackIndex].trackURL)
            audioPlayer?.delegate = self
            audioPlayer?.numberOfLoops = 0
            audioPlayer?.volume = UserDefaults.standard.backgroundMusicVolume
            audioPlayer?.play()
            delegate?.audioPlayerDidChangeTrack(trackName: audioTracks[trackIndex].trackName)
        }
    }
    
    func stopPlaying() {
        audioPlayer?.stop()
        audioPlayer?.delegate = nil
        audioPlayer = nil
    }
    
    func pausePlay() {
        if isPlaying() {
            audioPlayer?.pause()
        } else {
            audioPlayer?.play()
        }
    }
    
    func changeVolume(_ newVolume: Float) {
        audioPlayer?.volume = newVolume
    }
    
    func isPlaying() -> Bool {
        return audioPlayer?.isPlaying ?? false
    }
    
    func changeToNextTrack() {
        if trackIndex < audioTracks.count - 1 {
            trackIndex += 1
        } else {
            trackIndex = 0
            audioTracks.shuffle()
        }
        
        stopPlaying()
        play()
    }
    
    func changeToPreviousTrack() {
        if trackIndex > 0 {
            trackIndex -= 1
        } else {
            trackIndex = audioTracks.count - 1
            audioTracks.shuffle()
        }
        
        stopPlaying()
        play()
    }
    
    func currentTrackName() -> String {
        return audioTracks[trackIndex].trackName
    }
}

extension AudioPlayer: AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        changeToNextTrack()
    }
}
