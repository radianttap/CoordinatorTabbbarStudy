import UIKit

class HomeViewController: UIViewController {
    var goToHome2button: UIButton!
    
    init() {
        super.init(nibName: nil, bundle: nil)

		tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), tag: 0)

        title = "Home"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureButton()
    }
    
    private func configureButton() {
        goToHome2button = UIButton()
        view.addSubview(goToHome2button)
        goToHome2button.translatesAutoresizingMaskIntoConstraints = false
        
        goToHome2button.setTitle(" Go to Next Screen ", for: .normal)
        goToHome2button.layer.borderColor = UIColor.black.cgColor
        goToHome2button.layer.borderWidth = 2
        goToHome2button.backgroundColor = .black
        goToHome2button.addTarget(self, action: #selector(goToHome2), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            goToHome2button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToHome2button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func goToHome2() {
//        coordinator?.moveTo(flow: .home(.doubleButtonScreen), userData: ["title": "Top Title"])
    }
}
