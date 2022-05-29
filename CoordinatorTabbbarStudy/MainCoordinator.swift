import UIKit

enum AppFlow {
    case home(HomeScreen)
    case orders(OrdersScreen)
}

class MainCoordinator: Coordinator<UITabBarController> {
	override func start(with completion: @escaping () -> Void = {}) {
		super.start(with: completion)

		setupTabs()
    }
        
    func moveTo(flow: AppFlow, userData: [String : Any]?) {
        switch flow {
        case .home:
            goToHomeFlow(flow)
        case .orders:
            goToOrdersFlow(flow)
        }
    }
    
    private func goToOrdersFlow(_ flow: AppFlow) {
//        ordersCoordinator.moveTo(flow: flow, userData: nil)
//        (rootViewController as? UITabBarController)?.selectedIndex = 1
    }
    
    private func goToHomeFlow(_ flow: AppFlow) {
//        homeCoordinator.moveTo(flow: flow, userData: nil)
//        (rootViewController as? UITabBarController)?.selectedIndex = 0
    }
    
    func handleDeepLink(text: String) {
//        deepLinkCoordinator.handleDeeplink(deepLink: text)
    }
    
    func resetToRoot() -> Self {
//        homeCoordinator.resetToRoot(animated: false)
//        moveTo(flow: .home(.initialScreen), userData: nil)
        return self
    }
    
}

private extension MainCoordinator {
	func setupTabs() {
		let hc = HomeCoordinator()
		startChild(coordinator: hc)
		hc.rootViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), tag: 0)

		let oc = OrdersCoordinator()
		startChild(coordinator: oc)
		oc.rootViewController.tabBarItem = UITabBarItem(title: "Orders", image: UIImage(systemName: "doc.plaintext"), tag: 1)

		rootViewController.viewControllers = [
			hc.rootViewController,
			oc.rootViewController
		]
	}
}
