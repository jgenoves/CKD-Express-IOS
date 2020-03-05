//
//  User.swift
//  CKD Express
//
//  Created by Jordan Genovese on 2/23/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import Foundation

public class User {
    
    var id: Int?
    var email: String?
    var password: String?
    var firstName: String?
    var lastName: String?
    
    
    init (id userId: Int?, email userEmail: String?, password userPassword: String?, firstName userFirstName: String?, lastName userLastName: String?){
        id = userId
        email = userEmail
        password = userPassword
        firstName = userFirstName
        lastName = userLastName
    }
    
    
    
    //Getters
    
    func getId() -> Int? {
        return id
    }
    
    func getEmail() -> String? {
        return email
    }
    
    func getPassword() -> String? {
        return password
    
    }
    
    func getFirstName() -> String? {
        return firstName
    }
    
    func getLastName() -> String? {
        return lastName
    }
    
    
    //Setters
    
    func setId(setIdAs newId: Int?){
        id = newId
    }
    
    func setEmail(setEmailAs newEmail: String?){
        email = newEmail
    }
    
    func setPassword(setPasswordAs newPassword: String?){
        password = newPassword
    }
    
    func setFirstName(setFirstNameAs newFirstName: String?){
        firstName = newFirstName
    }
    
    func setLastName(setLastNameAs newLastName: String?){
        lastName = newLastName
    }
}

