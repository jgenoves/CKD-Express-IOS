//
//  Utilities.swift
//  CKD Express
//
//  Created by Jordan Genovese on 3/24/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import UIKit
import Firebase

class Utilities {
    
    
    
    static func loadPatientDataFromDB(data patientData: [String:Any]) -> Patient? {
    
        
        let firstName = patientData["firstName"] as! String
        let lastName = patientData["lastName"] as! String
        let ckdStage = patientData["ckdStage"] as! String
        let checkupNeeded = patientData["checkupNeeded"] as! Bool
        let nepthVisitNeeded = patientData["nephVisitNeeded"] as! Bool
        
        var gfrScores = Array<GFRScore>()

        let scores = patientData["gfrScores"] as! Dictionary<String, Dictionary<String, Any>>
        
        for entry in scores {
  
            let entryScore = entry.value["score"] as! Double
            let entryID = entry.value["id"] as! Int
            let entryLocation = entry.value["location"] as! String
            let entryDateRecorded = entry.value["dateRecorded"] as! Timestamp
            
            let newGFRScore = GFRScore( id: entryID, score: entryScore, date: entryDateRecorded, location: entryLocation )
            
            gfrScores.append(newGFRScore)
            
        }
        
        
        
        let newPatient = Patient(firstName: firstName, lastName: lastName, ckdStage: ckdStage, gfrScores: gfrScores, checkupNeeded: checkupNeeded, nepthVisitNeeded: nepthVisitNeeded)
        
        return (newPatient)
        
    }
    
    
    
    
    
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
    
    
    
    static func styleEmailAndPasswordInput(email email: UITextField, password password: UITextField){
        
        email.text = ""
        email.placeholder = "Email:"
        email.keyboardType = UIKeyboardType.init(rawValue: 7)!
        
        password.text = ""
        password.placeholder = "Password:"
    }
    
    
    static func styleFilledButton(_ button: UIButton){
        
        button.layer.cornerRadius = 25.0
    }
    
    

}
