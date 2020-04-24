//
//  PreLoginViewController.swift
//  CKD Express
//
//  Created by Jordan Genovese on 4/15/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class PreLoginViewController : UIViewController {
    
   
    let delegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(Auth.auth().currentUser != nil) {
            
            let uid = Auth.auth().currentUser!.uid
            
            self.queryDBandTransitionToHome(userId: uid)
            
        }
        
        else {
            
            self.transitionToLoginScreen()
            
        }
    }
    
    func queryDBandTransitionToHome(userId uid: String){
        
        //Query the database to get the document containing the users data
        self.delegate.db!.collection("USERS").whereField("authID", isEqualTo: uid).getDocuments() {
            
            (querySnapshot, err) in
            
            if let err = err {
                print("Error finding user in database \(err)")
            } else {
                
                for document in querySnapshot!.documents {
                    
                    let userData = document.data()
                    
                    self.delegate.activePatientUser = Utilities.loadPatientDataFromDB(data: userData)
                    
                    
                    self.delegate.activePatientUser.isNephDue()
                    self.delegate.activePatientUser.isCheckupDue()
                                        
                }
                
                self.transitionToPatientHome()
            }
        }
        
        
    }
    
    func transitionToPatientHome() {
        let patientHomeVC = storyboard?.instantiateViewController(identifier: "UIPatientTabBarVC") as? UIPatientTabBarController
        
        view.window?.rootViewController = patientHomeVC
        view.window?.makeKeyAndVisible()
        
        
    }
    
    func transitionToLoginScreen() {
        let loginScreenVC = storyboard?.instantiateViewController(withIdentifier: "LoginPageVC") as? LoginViewController
        
        view.window?.rootViewController = loginScreenVC
        view.window?.makeKeyAndVisible()

        
        
    }
    
}
