//
//  User.swift
//  CKD Express
//
//  Created by Jordan Genovese on 2/23/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import Foundation

public class User : NSObject {
    
    public var firstName: String
    public var lastName: String
    
    
    init (firstName userFirstName: String, lastName userLastName: String){
        firstName = userFirstName
        lastName = userLastName

        super.init()
    }
    
    
    
    
    func getFirstName() -> String {
        return firstName
    }
    
    func getLastName() -> String {
        return lastName
    }
    
    
    //Setters
    
    
    func setFirstName(setFirstNameAs newFirstName: String){
        firstName = newFirstName
    }
    
    func setLastName(setLastNameAs newLastName: String){
        lastName = newLastName
    }
}

