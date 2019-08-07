//
//  LoginViewController.swift
//
//
//  Created by Vasilii on 06/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private let userName = "User"
    private let password = "Password"

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: IBActions
    
    @IBAction func loginPressed() {
        if userNameTextField.text == userName && passwordTextField.text == password {
            performSegue(withIdentifier: "login", sender: nil)
        } else {
            let controller = UIAlertController(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                preferredStyle: .actionSheet
            )
            let alertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(alertButton)
            self.present(controller, animated: true)
        }
    }
    
    
    @IBAction func fogotUserNamePressed() {
        let controller = UIAlertController(
            title: "OK",
            message: "Your name is \(userName)",
            preferredStyle: .actionSheet
        )
        let alertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(alertButton)
        self.present(controller, animated: true)
    }
    
    @IBAction func fogotPasswordPressed() {
        let controller = UIAlertController(
            title: "OK",
            message: "Your password is \(password)",
            preferredStyle: .actionSheet
        )
        let alertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(alertButton)
        self.present(controller, animated: true)
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    
    @IBAction func textIFildDoneEditing(sender: UITextField) {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
 
    
    // MARK: Text Field Delegate
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            loginPressed()
        }
        return true
    }
    

    
}

