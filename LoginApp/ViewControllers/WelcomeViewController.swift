//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Maxim Datsuk on 04.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - @IBOutlets
    @IBOutlet var greetingLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Welcome, \(user.person.userName)!"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let navigationVC = viewController as? UINavigationController {
                guard let aboutMeVC = navigationVC.topViewController as? AboutMeViewController else { return }
                aboutMeVC.user = user
            } else if let jobVC = viewController as? JobViewController {
                jobVC.user = user
            } else if let hobbyVC = viewController as? HobbyViewController {
                hobbyVC.user = user
            }
        }
    }
}

class GradientView: UIView {
    
    // MARK: - @IBInspectables
    @IBInspectable private var topColor: UIColor? {
        didSet {
            setupGradientColors()
        }
    }
    @IBInspectable private var bottomColor: UIColor? {
        didSet {
            setupGradientColors()
        }
    }

    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    // MARK: - Private functions
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        setupGradientColors()
    }
    
    private func setupGradientColors() {
        if let topColor = topColor, let bottomColor = bottomColor {
            gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        }
    }
}
