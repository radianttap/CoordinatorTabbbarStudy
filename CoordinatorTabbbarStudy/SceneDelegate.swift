import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var mainCoordinator: MainCoordinator?
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

		let tc = UITabBarController()
		let c = MainCoordinator(rootViewController: tc)
		mainCoordinator = c

		window?.rootViewController = c.rootViewController
        window?.makeKeyAndVisible()
		c.start()
	}
    
}

