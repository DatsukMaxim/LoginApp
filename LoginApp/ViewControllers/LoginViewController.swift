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
    
    private let correctUserName = "User"
    private let correctPassword = "1234"

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = correctUserName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - @IBActions
    @IBAction func loginButtonTapped() {
        guard userNameTextField.text == correctUserName,
              passwordTextField.text == correctPassword
        else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
            return
        }
        
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotAuthDataTapped(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", message: "Your name is \(correctUserName) 😉")
            : showAlert(title: "Oops!", message: "Your password is \(correctPassword) 😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - UIAlertController
extension LoginViewController {
    private func showAlert(
        title: String,
        message: String,
        textField: UITextField? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
