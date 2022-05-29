import UIKit

extension UIResponder {
	@objc func openFlow(_ flow: AppFlowBox, userData: [String: Any]? = nil, sender: Any?) {
		coordinatingResponder?.openFlow(flow, userData: userData, sender: sender)
	}
}
