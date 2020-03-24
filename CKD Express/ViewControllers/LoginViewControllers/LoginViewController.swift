//
//  LoginViewController.swift
//  CKD Express
//
//  Created by Jordan Genovese on 3/23/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//
import UIKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElements()
    }
    
    @IBAction func loginToApplication(_ sender: UIButton) {
        
        let email = self.emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let password = self.passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        print("email: \(email), password: \(password)")
        
        if(validateFields(email: email, password: password)){
            let email = self.emailField.text
            let password = self.passwordField.text
            Auth.auth().signIn(withEmail: email!, password: password!) {
                (user, err) in
                
                if let err = err{
                    print("Error signing in: \(err)")
                } else{
                    print("Sign-in Success: \(user)" )
                }
              
            }
            
        }
        
    }
        
      
    func setupElements() {
        self.errorLabel.alpha = 0
    }
    
    func validateFields(email email: String, password password: String) -> Bool {
        
        resetLabels()
        
        let emailValid = Utilities.validateEmail(email)
        let passwordValid = Utilities.validatePassword(password)
        
        if(!emailValid || !passwordValid){
            displayErrors(emailStatus: emailValid, passwordStatus: passwordValid)
            return false
        }
        else {
            return true
        }
        
    }
    

        
    func displayErrors(emailStatus eStatus: Bool, passwordStatus pStatus: Bool){
        
        if(!eStatus && !pStatus){
            self.errorLabel.alpha = 0.75
            self.errorLabel.text = "Invalid Email and Password"
            self.passwordField.textColor = UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: 0.75)
            self.emailField.textColor = UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: 0.75)
        }
        else if(!eStatus) {
            self.emailField.textColor = UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: 0.75)
            self.errorLabel.alpha = 0.75
            self.errorLabel.text = "Invalid Email"
        }
        else if(!pStatus){
            self.passwordField.textColor = UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: 0.75)
            self.errorLabel.alpha = 0.75
            self.errorLabel.text = "Invalid Password"
            
        }
    }
    
    func resetLabels() {
        self.emailField.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.75)
        self.passwordField.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.75)
        self.errorLabel.alpha = 0
        self.errorLabel.text = ""
        
    }
    

    
    
}
