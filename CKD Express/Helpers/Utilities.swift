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
    
    static let app_blueColor = UIColor.init(red: 22/2555, green: 81/255, blue: 1, alpha: 1)
    
    static let app_inputTextColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.75)
    static let app_errorTextColor = UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: 0.75)
    
    
    
    static func loadPatientDataFromDB(data patientData: [String:Any]) -> Patient? {
    
        
        let firstName = patientData["firstName"] as! String
        let lastName = patientData["lastName"] as! String
        let ckdStage = patientData["ckdStage"] as! String
        let checkupNeeded = patientData["checkupNeeded"] as! Bool
        let nepthVisitNeeded = patientData["nephVisitNeeded"] as! Bool
        let baseGFRScore = patientData["baseGFRScore"] as! Double
        
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
        
        gfrScores = gfrScores.sorted(by: { $0.id > $1.id })
        
        
        
        let newPatient = Patient(firstName: firstName, lastName: lastName, ckdStage: ckdStage, gfrScores: gfrScores, checkupNeeded: checkupNeeded, nepthVisitNeeded: nepthVisitNeeded, baseGFRScore: baseGFRScore)
        
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
        email.textColor = self.app_inputTextColor
        
        password.text = ""
        password.placeholder = "Password:"
        email.textColor = self.app_inputTextColor
    }
    
    
    static func styleFilledButton(_ button: UIButton){
        
        button.layer.cornerRadius = 25.0
    }
    
    
    static func styleHollowButton(_ button: UIButton){
        
        button.layer.cornerRadius = 25.0
        button.layer.borderColor = self.app_blueColor.cgColor
        button.layer.borderWidth = 2
        button.alpha = 0.5
        button.tintColor = self.app_blueColor
        button.backgroundColor = UIColor.white
    }
    
    

}
