//
//  Patient.swift
//  CKD Express
//
//  Created by Jordan Genovese on 3/1/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import Foundation
import Firebase

public class Patient: User {
    
    var ckdStage: String
    var gfrScores: Array<GFRScore>
    var checkupNeeded: Bool
    var nephVisitNeeded: Bool
    var baseGFRScore: Double
    
    
    init(firstName pFirstName: String,
         lastName pLastName: String,
         ckdStage pckdStage: String,
         gfrScores pScores: Array<GFRScore>,
         checkupNeeded pCheckup: Bool,
         nepthVisitNeeded pNeph: Bool,
         baseGFRScore bScore: Double){
        
        ckdStage = pckdStage
        gfrScores = pScores
        checkupNeeded = pCheckup
        nephVisitNeeded = pNeph
        baseGFRScore = bScore
        
        super.init(firstName: pFirstName, lastName: pLastName)
    }
    

    
    //Getters
    
    func getCkdStage() -> String{
        return ckdStage
    }
    
    func getGfrScores() -> Array<GFRScore> {
        return gfrScores
    }
    
    func needCheckup() -> Bool {
        return checkupNeeded
    }
    
    func needNephVisit() -> Bool {
        return nephVisitNeeded
    }
    
    
    
    //Setters
    
    func setCkdStage(setCkdStageAs newCkdStage: String) {
        ckdStage = newCkdStage
    }
    
    func setGfrScores(setGfrScoresAs newGfrScores: Array<GFRScore>) {
        gfrScores = newGfrScores
    }
    
    func setCheckupNeeded(setCheckupNeededAs checkupStatus: Bool) {
        checkupNeeded = checkupStatus
    }
    
    func setNephVisitNeeded(setNephVisitNeededAs nephVisitStatus: Bool) {
        nephVisitNeeded = nephVisitStatus
    }
    
    
    func getMostRecentScore () -> GFRScore? {
        for score in gfrScores {
            if (score.id == gfrScores.count) {
                return score
            }
        }
        return nil
        
    }
    
    func determineBaseGFRScore () {
        
        var score_1: GFRScore!
        var score_2: GFRScore!
        var score_3: GFRScore!
        
        for score in self.gfrScores {
            switch score.id {
                
            case 1:
                score_1 = score
            case 2:
                score_2 = score
            case 3:
                score_3 = score
                
            default:
                return
            
            }
        }
        
        self.baseGFRScore = (score_1.score + score_2.score + score_3.score)/3
        
        
    }
    
    
    
    func determineCKDStage() {
        

        if(self.baseGFRScore < 30) {
            if(self.baseGFRScore < 15){
                ckdStage = "Stage 5"
            } else {
                ckdStage = "Stage 4"
            }
        } else {
            
            if(self.baseGFRScore > 90){
                ckdStage = "Stage 1"
            }
            else if(self.baseGFRScore >= 60 && self.baseGFRScore <= 90){
                ckdStage = "Stage 2"
            }
            else if(self.baseGFRScore >= 45 && self.baseGFRScore < 60){
                ckdStage = "Stage 3a"
            }
            else if(self.baseGFRScore >= 30 && self.baseGFRScore < 45){
                ckdStage = "Stage 3b"
            }
        }

        
        
    }
    
    func isNephDue () {
        
        let mostRecentEntry = self.getMostRecentScore()!
        
        
        switch self.ckdStage {
            
        case "Stage 1":
            if ((self.baseGFRScore - mostRecentEntry.score) >= 10) {
                self.nephVisitNeeded = true
            }
        
        case "Stage 2":
            if ((self.baseGFRScore - mostRecentEntry.score) >= 7.5) {
                self.nephVisitNeeded = true
            }
            
        case "Stage 3a":
            if ((self.baseGFRScore - mostRecentEntry.score) >= 10) {
                self.nephVisitNeeded = true
            }
            
        case "Stage 3b":
            if ((self.baseGFRScore - mostRecentEntry.score) >= 5) {
                self.nephVisitNeeded = true
            }
        
        case "Stage 4":
            self.nephVisitNeeded = true
            
        case "Stage 5":
            self.nephVisitNeeded = true
            
            
        default:
            return
            
        }

        
    }
    
    
    func isCheckupDue () {
        let mostRecentEntry = self.getMostRecentScore()!
        

        
        let today = Timestamp.init().dateValue()
        let lastCheckup = mostRecentEntry.dateRecorded.dateValue()
        let timeSince = DateInterval.init(start: lastCheckup, end: today)
        
        //timeSince is specified in seconds
        
        
        switch self.ckdStage {
            
        case "Stage 1":
            if(timeSince.duration) >= 15552000 {
                    
                self.checkupNeeded = true
            }
            
        
        case "Stage 2":
            if(timeSince.duration) >= 15552000 {
                    
                self.checkupNeeded = true
            }
            
        case "Stage 3a":
            if(timeSince.duration) >= 7776000 {
                    
                self.checkupNeeded = true
            }
            
        case "Stage 3b":
            if(timeSince.duration) >= 5184000 {
                    
                self.checkupNeeded = true
            }
            
            
        default:
            return
            
        }
        
        
    }
    
}
