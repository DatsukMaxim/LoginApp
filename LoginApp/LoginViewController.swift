//
//  ViewController.swift
//  LoginApp
//
//  Created by Maxim Datsuk on 04.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - @IBOutlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    private let correctUserName = "user1"
    private let correctPassword = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - @IBActions
    @IBAction func loginButtonTapped() {
        if userNameTextField.text == correctUserName && passwordTextField.text == correctPassword {
            print("login success")
        } else {
            showAlert(
                with: "Invalid login or password!",
                and: "Please, enter correct login and password"
            )
        }
    }
}

// MARK: - UIAlertController
extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
