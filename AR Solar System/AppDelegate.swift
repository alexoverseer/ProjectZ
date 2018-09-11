import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setUpWindow()
        
//        let spacePeopleAPI: SpacePeopleProtocol = SpacePeople()
//        spacePeopleAPI.requestSpacePeopleDetails(onSuccess: { people in
//            print(people)
//        }, onFailure: { error in
//            print(error)
//        })
        
        return true
    }
    
    private func setUpWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SolarSystemBuilder.build()
        window?.makeKeyAndVisible()
    }
}
