//
//  FirebaseFunctions.swift
//  CKD Express
//
//  Created by Jordan Genovese on 3/27/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

import Foundation

let delegate = UIApplication.shared.delegate as! AppDelegate

class FirebaseAuthFunctions {
    
    static public func loginUser (userEmail email: String, userPassword password: String) -> String? {
        
        var authId: String?
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, err) in
            
            if let err = err {
                print("Error logging in")
                authId = nil
            }
            else {
                print("User found")
                authId = result!.user.uid
            }
            
            
        }
        
        return authId
        
        
    }
}

class FirebaseQueries {
    
    
    static func loadUserData(authId id: String) -> (userData: [String:Any]?, userDocId: String?) {
        
        var userData: [String:Any]?
        var docId: String?
        delegate.db!.collection("USERS").whereField("authId", isEqualTo: id).getDocuments() {
            
            (querySnapshot, err) in
            
            if let err = err {
                print("Error: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    userData! = document.data()
                    docId! = document.documentID
                    
                }
            }
        }
        
        return (userData, docId)
        
    }
    
    
    
    
    
    
    struct PatientQueries {
        
        static func loadPatientScores(docId id: String) -> Array<GFRScore> {
            
            var scores = Array<GFRScore>()
            
            delegate.db!.collection("USERS").document(id).collection("GFR_SCORES").getDocuments() {
                
                (querySnapshot, err) in
                
                if let err = err {
                    print("Error loading patient gfr scores")
                } else {
                    for document in querySnapshot!.documents {
                        let score = document.get("score") as! Double
                        let date = document.get("dateRecorded") as! Timestamp
                        let location = document.get("location") as! String
                        let id = document.get("id") as! Int
                        
                        let newScore = GFRScore(id: id, score: score, date: date, location: location)
                        
                        scores.append(newScore)
                        
                    }
                }
            }
            
            return scores
            
            
        }
    }
    
    

}

