//
//  ChangeCriteriaViewController.swift
//  CKD Express
//
//  Created by Jordan Genovese on 4/24/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import Foundation

import UIKit
import FirebaseAuth
import Firebase
class ChangeCriteriaViewController : UIViewController {
    
    var type: String!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var newField: UITextField!
    @IBOutlet var newConfirmField: UITextField!
    @IBOutlet var confirmButton: UIButton!
    @IBOutlet var errorLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupElements()
    }
    
    func setupElements() {
        switch self.type {
                
            case "email":
                self.titleLabel.text = "Change Email"
                self.newField.placeholder = "New Email"
                self.newConfirmField.placeholder = "Confirm new Email"
                
            case "password":
                self.titleLabel.text = "Change Password"
                self.newField.placeholder = "New Password"
                self.newConfirmField.placeholder = "Confirm new Password"
                
                self.newField.isSecureTextEntry = true
                self.newField.isSecureTextEntry = true
                
            default:
                self.newField.placeholder = "Error"
                self.newConfirmField.placeholder = "Error"
        }
        
        self.errorLabel.isHidden = true
        
        
        
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton ) {
        
        switch self.type {
            
            
        case "email":
            self.validateAndChangeEmail(newEmail: self.newField.text!, newConfirmEmail: self.newConfirmField.text!)
            
        case "password":
            self.validateAndChangePassword(newPassword: self.newField.text!, newConfirmPassword: self.newConfirmField.text!)
            
        default:
            return
        }
    }
    
    func validateAndChangeEmail(newEmail nE: String, newConfirmEmail ncE: String){
        
        if(validateFields(new: nE, newConfirm: ncE)){
            Auth.auth().currentUser?.updateEmail(to: nE) {
                (err) in
               
                if let err = err {
                    self.errorLabel.text = "\(err.localizedDescription)"
                    self.errorLabel.isHidden = false
                    self.errorLabel.font = UIFont.init(name: "Helvetica", size: 16)
                    self.newField.textColor = Utilities.app_errorTextColor
                    self.newConfirmField.textColor = Utilities.app_errorTextColor
                }
                else {
                    let alertMessage = UIAlertController(title: "Email Change Success", message: "Success!", preferredStyle: .alert)
                           
                           let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in
                                print("Confirm button tapped")
                                
                                //pop view off stack
                                
                           })
                           alertMessage.addAction(confirmAction)
                           
                           self.present(alertMessage, animated: true, completion: nil)
                    
                }
            }
            
            
        }
        
        
        
        
    }
    
    func validateAndChangePassword(newPassword nP: String, newConfirmPassword ncP: String){
        
        if(validateFields(new: nP, newConfirm: ncP)){
                Auth.auth().currentUser?.updatePassword(to: nP) {
                    (err) in
                   
                    if let err = err {
                        self.errorLabel.text = "\(err.localizedDescription)"
                        self.errorLabel.isHidden = false
                        self.errorLabel.font = UIFont.init(name: "Helvetica", size: 16)
                        self.newField.textColor = Utilities.app_errorTextColor
                        self.newConfirmField.textColor = Utilities.app_errorTextColor
                    }
                    else {
                        let alertMessage = UIAlertController(title: "Password Change Success", message: "Success!", preferredStyle: .alert)
                               
                               let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in
                                    print("Confirm button tapped")
                                    
                                    //pop view off stack
                                    
                               })
                               alertMessage.addAction(confirmAction)
                               
                               self.present(alertMessage, animated: true, completion: nil)
                        
                    }
                }
                
                
        }
        
    }
    
    func validateFields(new n: String, newConfirm nc: String) -> Bool {
        
        self.resetLabels()
        
        switch self.type {
            
        case "email":
            if(n != nc){
                self.errorLabel.text = "New emails do not match"
                self.newField.textColor = Utilities.app_errorTextColor
                self.newConfirmField.textColor = Utilities.app_errorTextColor
                self.errorLabel.isHidden = false
                return false
            }
        
            
            return true

        case "password":
            if(n != nc){
                self.errorLabel.text = "New passwords do not match"
                self.newField.textColor = Utilities.app_errorTextColor
                self.newConfirmField.textColor = Utilities.app_errorTextColor
                self.errorLabel.isHidden = false
                return false
            }
            
            return true
            
        default:
            return false
        }
        
        
    }
    

    func resetLabels() {
        self.newField.textColor = Utilities.app_inputTextColor
        self.newConfirmField.textColor = Utilities.app_inputTextColor
        self.errorLabel.isHidden = true
        
    }
    
}
