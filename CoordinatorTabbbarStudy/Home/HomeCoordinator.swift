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

	override func openFlow(_ flowboxed: AppFlowBox, userData: [String : Any]? = nil, sender: Any?) {
		let flow = flowboxed.unbox

		switch flow {
			case .home(let screen):
				displayScreen(screen, userData: userData, sender: sender)

			case .orders:
				coordinatingResponder?.openFlow(flowboxed, userData: userData, sender: sender)
		}
	}

	func displayScreen(_ screen: HomeScreen, userData: [String: Any]? = nil, sender: Any? = nil) {
	}
    
    private func handleHomeFlow(for screen: HomeScreen, userData: [String: Any]?) {
//        switch screen {
//        case .initialScreen:
//            navigationRootViewController?.popToRootViewController(animated: true)
//        case .doubleButtonScreen:
//            guard let title = userData?["title"] as? String else { return }
//            goToHome2ScreenWith(title: title)
//        }
    }
    
    func goToHome2ScreenWith(title: String) {
//        let home2ViewController = Home2ViewController(coordinator: self)
//        home2ViewController.title = title
//        navigationRootViewController?.pushViewController(home2ViewController, animated: true)
    }
//
//    func goToFavoritesFlow() {
//        parentCoordinator?.moveTo(flow: .orders(.firstScreen))
//    }
//
//    func goToDeepViewInFavoriteTab() {
//
//        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
//                self?.parentCoordinator?.ordersCoordinator
//                    .resetToRoot(animated: false)
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now()+0.1) { [weak self] in
//                self?.parentCoordinator?.ordersCoordinator
//                    .goToOrder2Screen(animated: false)
//                    .goToOrder3Screen(animated: false)
//                self?.parentCoordinator?.moveTo(flow: .orders)
//            }
//    }
    
    func resetToRoot() -> Self {
//        navigationRootViewController?.popToRootViewController(animated: false)
        return self
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
}
