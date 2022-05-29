import UIKit

enum AppFlow {
    case home(HomeScreen)
    case orders(OrdersScreen)
}

///	ObjC wrapper for `AppFlow`  to faciliate usage of non-ObjC types as arguments for ObjC methods.
final class AppFlowBox: NSObject {
	let unbox: AppFlow
	init(_ value: AppFlow) {
		self.unbox = value
	}
}
extension AppFlow {
	var boxed: AppFlowBox { return AppFlowBox(self) }
}







class MainCoordinator: Coordinator<UITabBarController> {
	override func start(with completion: @escaping () -> Void = {}) {
		super.start(with: completion)

		setupTabs()
    }

	override func openFlow(_ flowboxed: AppFlowBox, keepHierarchy: Bool = false, userData: [String : Any]? = nil, sender: Any?) {
		let flow = flowboxed.unbox

		switch flow {
			case .home(let screen):
				guard let c = childCoordinators.child(matching: HomeCoordinator.self) else { return }
				c.displayScreen(screen, userData: userData, sender: sender)
				rootViewController.selectedIndex = 0

			case .orders(let screen):
				guard let c = childCoordinators.child(matching: OrdersCoordinator.self) else { return }
				c.displayScreen(screen, userData: userData, sender: sender)
				rootViewController.selectedIndex = 1
		}
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
