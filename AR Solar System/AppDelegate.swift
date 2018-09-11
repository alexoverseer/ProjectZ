import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setUpWindow()
        
        return true
    }
    
    private func setUpWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SolarSystemBuilder.build()
        window?.makeKeyAndVisible()
    }
}
