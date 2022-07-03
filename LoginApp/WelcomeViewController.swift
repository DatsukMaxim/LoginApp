//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Maxim Datsuk on 04.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - @IBOutlets
    @IBOutlet var userNameLabel: UILabel!
    
    var userNameValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        userNameLabel.text = userNameValue
    }
    
    // MARK: - @IBActions
    @IBAction func logoutButtonPressed() {
        dismiss(animated: true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let loginVC = segue.destination as? LoginViewController else { return }
        
        loginVC.userNameTextField.text = ""
        loginVC.passwordTextField.text = ""
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
