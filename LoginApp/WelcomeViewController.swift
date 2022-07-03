//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Maxim Datsuk on 04.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var userNameLabel: UILabel!
    
    var userNameValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let loginVC = segue.source as? LoginViewController {
            userNameLabel.text = loginVC.userNameTextField.text
        }
    }
    
    @IBAction func logoutButtonPressed() {
        dismiss(animated: true)
    }
}

class GradientView: UIView {
    
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
