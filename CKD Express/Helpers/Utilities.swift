//
//  Utilities.swift
//  CKD Express
//
//  Created by Jordan Genovese on 3/24/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import UIKit

class Utilities {
    
    static func validateEmail(_ email: String) -> Bool {
        //Check if email is valid
        if email == "" {
            return false
        }
        else{
            return true
        }
       
    }
    
    static func validatePassword(_ password: String) -> Bool {
        //Check if password is valid
        if password == "" {
            return false
        }
        else{
            return true
        }
    }
    
    

}
