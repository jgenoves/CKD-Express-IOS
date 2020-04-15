//
//  PatientSettingsViewController.swift
//  CKD Express
//
//  Created by Jordan Genovese on 4/15/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class PatientSettingsViewController : UIViewController {
    
    @IBOutlet var signOutButton: UIButton!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupElements()
        
        
        
    }
    
    
    @IBAction func signOutButtonAction(_ sender: UIButton) {
        
        
        let alertMessage = UIAlertController(title: "Sign Out Confirmation", message: "Are you sure you want to sign out?", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
             print("Confirm button tapped")
             self.signUserOut()
             
        })
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        
        alertMessage.addAction(confirmAction)
        alertMessage.addAction(cancelAction)
        
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    
    func signUserOut() {
        
        let firebaseAuth = Auth.auth()
        
        do {
          try
            
            firebaseAuth.signOut()
            self.delegate.activePatientUser = nil
            self.transitionToLoginScreen()
            
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        
        
    }
    
    func transitionToLoginScreen() {
        let loginScreenVC = storyboard?.instantiateViewController(withIdentifier: "LoginPageVC") as? LoginViewController
        
        view.window?.rootViewController = loginScreenVC
        view.window?.makeKeyAndVisible()

        
        
    }
    
    
    
    func setupElements () {
        
        Utilities.styleHollowButton(self.signOutButton)

    }
}
