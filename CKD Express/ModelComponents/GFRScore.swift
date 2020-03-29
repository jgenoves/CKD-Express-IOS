//
//  GFRScore.swift
//  CKD Express
//
//  Created by Jordan Genovese on 3/1/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import Foundation
import Firebase

public class GFRScore : NSObject {
    
    var id: Int
    var score: Double
    var dateRecorded: Timestamp
    var locationRecorded: String
    
    init(id newId: Int, score newScore: Double, date newDate: Timestamp, location newLocation: String) {
        
        id = newId
        score = newScore
        dateRecorded = newDate
        locationRecorded = newLocation
        
        super.init()
    }
    
    
    
}
