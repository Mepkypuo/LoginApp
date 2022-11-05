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
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var forgotUsernameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTF.text
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func forgotUsernameButtonPressed() {
        showAlert(withTitle: "Your User Name", andMessage: "Max")
    }
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(withTitle: "Your Password", andMessage: "123")
    }
    @IBAction func loginButtonPressed() {
        switch (userNameTF.text, passwordTF.text) {
        case ("Max","123"):
            performSegue(withIdentifier: "Welcome", sender: nil)
        default:
            showAlert(
                withTitle: "Invalid UserName or Password",
                andMessage: "Please, enter correct login or password")
           }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? WelcomeViewController else { return }
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - UIAlertController
extension LoginViewController {
    private func showAlert(withTitle title : String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            _ in
            self.userNameTF.text = ""
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
