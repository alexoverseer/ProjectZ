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
        
        loadPlayerState()
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
    }
    
    @IBAction private func backgroundMusicSliderValueChanged(_ sender: UISlider) {
        UserDefaults.standard.backgroundMusicVolume = sender.value
    }
    
    @IBAction private func changeToPreviousTrack() {
        
    }
    
    @IBAction private func changeToNextTrack() {
        
    }
    
    @IBAction private func playPauseButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}

extension AudioPlayerViewController: AudioPlayerInput {
    
}
