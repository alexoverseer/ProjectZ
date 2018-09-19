import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpWindow()
        configurateInitialState()
        
        return true
    }
    
    private func setUpWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SolarSystemBuilder.build()
        window?.makeKeyAndVisible()
    }
    
    private func configurateInitialState() {
        let firstLaunch = FirstLaunch(userDefaults: .standard,
                                      key: "com.bananaland.AR-Solar-System.WasLaunchedBefore")
        if firstLaunch.isFirstLaunch {
            UserDefaults.standard.backgroundMusicState = true
            UserDefaults.standard.backgroundMusicVolume = 1.0
        }
    }
}
