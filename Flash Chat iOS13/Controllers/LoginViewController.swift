//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginErrorMessage: UILabel!
    @IBOutlet weak var loginErrorIcon: UIImageView!
    
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password=passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.loginErrorMessage.isHidden = false
                    self.loginErrorMessage.textColor = #colorLiteral(red: 1, green: 0.207202822, blue: 0.2017843723, alpha: 1)
                    self.loginErrorMessage.text = e.localizedDescription
                    self.loginErrorIcon.isHidden = false
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
}
