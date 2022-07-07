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
    
    var userName = ""
    private let user = User.getUserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Welcome, \(userName)!"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let aboutMeVC = viewController as? AboutMeViewController {
                //почему-то не заходит сюда, а сразу идет в hobbyVC
                print("aboutMeVC")
                aboutMeVC.view.backgroundColor = .red
            } else if let petVC = viewController as? PetViewController {
                print("petVC")
                petVC.view.backgroundColor = .green
            } else if let hobbyVC = viewController as? HobbyViewController {
                print("hobbyVC")
                hobbyVC.view.backgroundColor = .systemMint
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
