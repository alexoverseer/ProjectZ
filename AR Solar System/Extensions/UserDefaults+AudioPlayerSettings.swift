import Foundation

extension UserDefaults {
    
    private static let kBackgroundMusicStateKey = "kBackgroundMusicStateKey"
    private static let kBackgroundMusicVolumeKey = "kBackgroundMusicVolumeKey"
    
    var backgroundMusicState: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDefaults.kBackgroundMusicStateKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.kBackgroundMusicStateKey)
            synchronize()
        }
    }
    
    var backgroundMusicVolume: Float {
        get {
            return UserDefaults.standard.float(forKey: UserDefaults.kBackgroundMusicVolumeKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.kBackgroundMusicVolumeKey)
            synchronize()
        }
    }
}
