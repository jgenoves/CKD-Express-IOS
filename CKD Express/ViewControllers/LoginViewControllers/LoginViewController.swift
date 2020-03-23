//
//  LoginViewController.swift
//  CKD Express
//
//  Created by Jordan Genovese on 3/23/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var usernameInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginToApplication(_ sender: UIButton) {
        print("hello")
    }



}
