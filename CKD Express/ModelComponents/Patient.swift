//
//  Patient.swift
//  CKD Express
//
//  Created by Jordan Genovese on 3/1/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import Foundation

public class Patient: User {
    
    var ckdStage: String?
    var gfrScores: Array<GFRScore>?
    var checkupNeeded: Bool?
    var nephVisitNeeded: Bool?
    
    
    
    //Getters
    
    func getCkdStage() -> String?{
        return ckdStage
    }
    
    func getGfrScores() -> Array<GFRScore>? {
        return gfrScores
    }
    
    func needCheckup() -> Bool? {
        return checkupNeeded
    }
    
    func needNephVisit() -> Bool? {
        return nephVisitNeeded
    }
    
    
    
    //Setters
    
    func setCkdStage(setCkdStageAs newCkdStage: String?) {
        ckdStage = newCkdStage
    }
    
    func setGfrScores(setGfrScoresAs newGfrScores: Array<GFRScore>?) {
        gfrScores = newGfrScores
    }
    
    func setCheckupNeeded(setCheckupNeededAs checkupStatus: Bool?) {
        checkupNeeded = checkupStatus
    }
    
    func setNephVisitNeeded(setNephVisitNeededAs nephVisitStatus: Bool?) {
        nephVisitNeeded = nephVisitStatus
    }
    
}
