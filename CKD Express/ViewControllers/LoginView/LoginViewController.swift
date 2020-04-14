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
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        
        //Validate fields
        if(validateFields(email: self.emailField.text, password: self.passwordField.text)){
            
            //Clean input
            let email = self.emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let password = self.passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Send input to signIn function
            signInUser(email: email, password: password)
        }
        
    }
    
    func transitionToPatientHome() {
        let patientHomeVC = storyboard?.instantiateViewController(identifier: "UIPatientTabBarVC") as? UIPatientTabBarController
        
        view.window?.rootViewController = patientHomeVC
        view.window?.makeKeyAndVisible()
        
        
    }
    
    func signInUser(email e: String, password p: String) {
        
        //Sign in user using email and password passed in after validation
        Auth.auth().signIn(withEmail: e, password: p) {
            (result, err) in
            
            if let err = err {
                print("Error Logging in \(err)")
            } else {
                
                print("Login Success")
                //Store the google auth user id
                let uid = result!.user.uid
                
                //Query the database to get the document containing the users data
                self.delegate.db!.collection("USERS").whereField("authID", isEqualTo: uid).getDocuments() {
                    
                    (querySnapshot, err) in
                    
                    if let err = err {
                        print("Error finding user in database \(err)")
                    } else {
                        
                        for document in querySnapshot!.documents {
                            
                            let userData = document.data()
                            
                            self.delegate.activePatientUser = Utilities.loadPatientDataFromDB(data: userData)
                            
                            print(self.delegate.activePatientUser.getGfrScores())
                            
                            
                            //Transition to appropriate view based on userType, either patient or admin
                            
                        
                            
                        }
                        
                        self.transitionToPatientHome()
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    
    
        
      
    func setupElements() {
        self.errorLabel.alpha = 0
    }
    
    func validateFields(email e: String?, password p: String?) -> Bool {
        
        resetLabels()
        
        var emailValid: Bool
        var passwordValid: Bool
        
        if e != nil{
            emailValid = Utilities.validateEmail(e!)
        } else {
            emailValid = false
        }
        
        if p != nil{
            passwordValid = Utilities.validatePassword(p!)
        } else {
            passwordValid = false
        }
        
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
