//
//  ViewController.swift
//  LoginApp
//
//  Created by Максим Жиляев on 04.11.2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let userName = "Max"
    private let password = "123"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTF.text
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func forgotUsernameButtonPressed() {
        showAlert(withTitle: "Your User Name", andMessage: userName)
    }
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(withTitle: "Your Password", andMessage: password)
    }
    @IBAction func loginButtonPressed() {
        if (userNameTF.text, passwordTF.text) == (userName, password) { performSegue(withIdentifier: "Welcome", sender: nil)
        } else { showAlert(
            withTitle: "Invalid UserName or Password",
            andMessage: "Please, enter correct login or password"
        )
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTF.text = ""
    }
}

// MARK: - UIAlertController
extension LoginViewController {
    private func showAlert(withTitle title : String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
