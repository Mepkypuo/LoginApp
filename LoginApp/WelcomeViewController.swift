//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Максим Жиляев on 04.11.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var userNameLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = userName
    }
}
