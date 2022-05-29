import UIKit

enum OrdersScreen {
	case firstScreen
	case secondScreen
	case thirdScreen
}

class OrdersCoordinator: NavigationCoordinator {
	required init() {
		let nc = UINavigationController()
		super.init(rootViewController: nc)
	}

	override func start(with completion: @escaping () -> Void = {}) {
		super.start(with: completion)

		setupInitialContent()
	}

	override func openFlow(_ flowboxed: AppFlowBox, userData: [String : Any]? = nil, sender: Any?) {
		let flow = flowboxed.unbox

		switch flow {
			case .home:
				coordinatingResponder?.openFlow(flowboxed, userData: userData, sender: sender)

			case .orders(let screen):
				displayScreen(screen, userData: userData, sender: sender)
		}
	}

	func displayScreen(_ screen: OrdersScreen, userData: [String: Any]? = nil, sender: Any? = nil) {

	}
    
    private func handleOrdersFlow(for screen: OrdersScreen, userData: [String : Any]? = nil) {
        switch screen {
        case .firstScreen:
            resetToRoot(animated: false)
        case .secondScreen:
            handleGoToSecondScreen()
        case .thirdScreen:
            handleGoToThirdScreen()
        }
    }
    
    private func handleGoToSecondScreen() {
        resetToRoot(animated: false)
//        navigationRootViewController?.pushViewController(Orders2ViewController(coordinator: self), animated: false)
    }
    
    private func handleGoToThirdScreen() {
        resetToRoot(animated: false)
//        navigationRootViewController?.pushViewController(Orders2ViewController(coordinator: self), animated: false)
//        navigationRootViewController?.pushViewController(Orders3ViewController(coordinator: self), animated: false)
    }
   
    @discardableResult
    func resetToRoot(animated: Bool) -> Self {
//        navigationRootViewController?.popToRootViewController(animated: animated)
        return self
    }
}

private extension OrdersCoordinator {
	func setupInitialContent() {
		rootViewController.viewControllers = [
			prepareFirstScreen()
		]
	}

	func prepareFirstScreen() -> OrdersViewController {
		let vc = OrdersViewController()
		return vc
	}
}
