//
//  LoginVC.swift
//  DevChat
//
//  Created by Brennan Linse on 2/18/18.
//  Copyright © 2018 Brennan Linse. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailTextField: RoundTextField!
    @IBOutlet weak var passwordTextField: RoundTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text, (email.count > 0 && password.count > 0) {
            AuthService.instance.signIn(email: email, password: password, onComplete: { (errorMessage, data) in
                // Check for sign-in errors
                guard errorMessage == nil else {
                    let alertController = UIAlertController(title: "Auth Error", message: errorMessage!, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
                // If no errors, we must have signed in successfully. Dismiss the login screen.
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            // The user hasn't entered something in both username and PW text fields.
            let alertController = UIAlertController(title: "Username and PW required", message: "You need both, fool!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    
    
    
}
