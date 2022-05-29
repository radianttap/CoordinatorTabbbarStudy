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
		switch screen {
			case .firstScreen:
				if let vc = viewControllers.first(where: { $0 is OrdersViewController }) {
					pop(to: vc)
					return
				}
				let vc = prepareFirstScreen()
				root(vc)

			case .secondScreen:
				if let vc = viewControllers.first(where: { $0 is Orders2ViewController }) {
					pop(to: vc)
					return
				}
				let vc = prepareSecondScreen()
				show(vc)

			case .thirdScreen:
				if let vc = viewControllers.first(where: { $0 is Orders3ViewController }) {
					pop(to: vc)
					return
				}
				let vc = prepareThirdScreen()
				show(vc)
		}
	}
    
    @discardableResult
    func resetToRoot(){
		displayScreen(.firstScreen)
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

	func prepareSecondScreen() -> Orders2ViewController {
		let vc = Orders2ViewController()
		return vc
	}

	func prepareThirdScreen() -> Orders3ViewController {
		let vc = Orders3ViewController()
		return vc
	}
}
