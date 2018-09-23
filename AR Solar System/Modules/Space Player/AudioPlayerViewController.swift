import UIKit

final class AudioPlayerViewController: UIViewController, StoryboardInstantiable {
    
    static let storyboardName = "AudioPlayerViewController"
    
    var interactor: AudioPlayerOutput!
    
    @IBOutlet private weak var backgroundMusicSwitch: UISwitch!
    @IBOutlet private weak var backgroundMusicVolumeSlider: UISlider!
    @IBOutlet private weak var trackNameLabel: UILabel!
    @IBOutlet private weak var playPauseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.viewDidLoad()
        loadPlayerState()
        updatePlayPauseButtonState()
    }
    
    // MARK: - Private functions
    
    private func loadPlayerState() {
        backgroundMusicSwitch.isOn = UserDefaults.standard.backgroundMusicState
        backgroundMusicVolumeSlider.value = UserDefaults.standard.backgroundMusicVolume
    }
    
    @IBAction private func closeController() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func backgroundMusicSwitchAction(_ sender: UISwitch) {
        UserDefaults.standard.backgroundMusicState = sender.isOn
        AudioPlayer.shared.isPlaying() ? AudioPlayer.shared.stopPlaying() : AudioPlayer.shared.play()
        updatePlayPauseButtonState()
    }
    
    @IBAction private func backgroundMusicSliderValueChanged(_ sender: UISlider) {
        UserDefaults.standard.backgroundMusicVolume = sender.value
        AudioPlayer.shared.changeVolume(sender.value)
    }
    
    @IBAction private func changeToPreviousTrack() {
        AudioPlayer.shared.changeToPreviousTrack()
    }
    
    @IBAction private func changeToNextTrack() {
        AudioPlayer.shared.changeToNextTrack()
    }
    
    @IBAction private func playPauseButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        AudioPlayer.shared.pausePlay()
        updatePlayPauseButtonState()
    }
    
    @IBAction func closeControllerGesture(_ sender: UISwipeGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    
    private func updatePlayPauseButtonState() {
        if AudioPlayer.shared.isPlaying() {
            playPauseButton.isSelected = true
        } else {
            playPauseButton.isSelected = false
        }
    }
}

extension AudioPlayerViewController: AudioPlayerInput {
    
    func showTrackName(trackName: String) {
        trackNameLabel.text = trackName
    }
}
