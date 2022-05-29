import UIKit

enum HomeScreen {
	case initialScreen
	case doubleButtonScreen
}

class HomeCoordinator: NavigationCoordinator {
	required init() {
		let nc = UINavigationController()
		super.init(rootViewController: nc)
	}

	override func start(with completion: @escaping () -> Void = {}) {
		super.start(with: completion)

		setupInitialContent()
	}

	override func openFlow(_ flowboxed: AppFlowBox, keepHierarchy: Bool = false, userData: [String : Any]? = nil, sender: Any?) {
		let flow = flowboxed.unbox

		switch flow {
			case .home(let screen):
				displayScreen(screen, userData: userData, sender: sender)

			case .orders:
				coordinatingResponder?.openFlow(flowboxed, keepHierarchy: keepHierarchy, userData: userData, sender: sender)
		}
	}

	func displayScreen(_ screen: HomeScreen, keepHierarchy: Bool = false, userData: [String: Any]? = nil, sender: Any? = nil) {
		switch screen {
			case .initialScreen:
				if let vc = viewControllers.first(where: { $0 is HomeViewController }) {
					pop(to: vc)
					return
				}
				let vc = prepareFirstScreen()
				root(vc)

			case .doubleButtonScreen:
				if let vc = viewControllers.first(where: { $0 is Home2ViewController }) {
					pop(to: vc)
					return
				}
				let vc = prepareSecondScreen()
				show(vc)
		}
	}

    func resetToRoot() {
		displayScreen(.initialScreen)
    }
}

private extension HomeCoordinator {
	func setupInitialContent() {
		rootViewController.viewControllers = [
			prepareFirstScreen()
		]
	}

	func prepareFirstScreen() -> HomeViewController {
		let vc = HomeViewController()
		return vc
	}

	func prepareSecondScreen() -> Home2ViewController {
		let vc = Home2ViewController()
		return vc
	}
}
