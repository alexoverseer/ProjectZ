import Foundation

struct DefaultAppConfigurator: AppConfigurable {
    
    static let kAppFirstLaunch = "com.bananaland.AR-Solar-System.WasLaunchedBefore"
    
    static func configurateInitialState() {
        let firstLaunch = FirstLaunch(userDefaults: .standard,
                                      key: kAppFirstLaunch)
        if firstLaunch.isFirstLaunch {
            UserDefaults.standard.backgroundMusicState = true
            UserDefaults.standard.backgroundMusicVolume = 1.0
        }
    }
}
