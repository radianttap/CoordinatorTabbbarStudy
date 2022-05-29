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

    func moveTo(flow: AppFlow, userData: [String : Any]? = nil) {
//        switch flow {
//        case .orders(let screen):
//            handleOrdersFlow(for: screen, userData: userData)
//        default:
//            parentCoordinator?.moveTo(flow: flow, userData: userData)
//        }
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
