import UIKit

class Home2ViewController: UIViewController {
    var goToFavoriteButton: UIButton!
    var goToFavoriteDeepViewButton: UIButton!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Home 2"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        
        configureButtonGoToFavorite()
        configureGoToFavoriteDeepViewButton()
    }
    
    private func configureButtonGoToFavorite() {
        goToFavoriteButton = UIButton()
        view.addSubview(goToFavoriteButton)
        goToFavoriteButton.translatesAutoresizingMaskIntoConstraints = false
        
        goToFavoriteButton.setTitle(" Go to favorite tab ", for: .normal)
        goToFavoriteButton.layer.borderColor = UIColor.black.cgColor
        goToFavoriteButton.layer.borderWidth = 2
        goToFavoriteButton.backgroundColor = .black
        goToFavoriteButton.addTarget(self, action: #selector(goToFavoriteTab), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            goToFavoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToFavoriteButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func configureGoToFavoriteDeepViewButton() {
        goToFavoriteDeepViewButton = UIButton()
        view.addSubview(goToFavoriteDeepViewButton)
        goToFavoriteDeepViewButton.translatesAutoresizingMaskIntoConstraints = false
        
        goToFavoriteDeepViewButton.setTitle(" Go to deep view in Orders tab ", for: .normal)
        goToFavoriteDeepViewButton.layer.borderColor = UIColor.black.cgColor
        goToFavoriteDeepViewButton.layer.borderWidth = 2
        goToFavoriteDeepViewButton.backgroundColor = .red
        goToFavoriteDeepViewButton.addTarget(self, action: #selector(goToDeepViewInOrdersTab), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            goToFavoriteDeepViewButton.topAnchor.constraint(equalTo: goToFavoriteButton.bottomAnchor, constant: 20),
            goToFavoriteDeepViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func goToFavoriteTab() {
		openFlow(AppFlow.orders(.firstScreen).boxed, sender: self)
    }
    
    @objc private func goToDeepViewInOrdersTab() {
		openFlow(AppFlow.orders(.thirdScreen).boxed, sender: self)
    }
}
