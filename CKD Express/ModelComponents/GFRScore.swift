//
//  GFRScore.swift
//  CKD Express
//
//  Created by Jordan Genovese on 3/1/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import Foundation

public class GFRScore {
    
    var score: Double?
    var dateRecorded: Date?
    var locationRecorded: String?
    
    init(score newScore: Double?, date newDate: Date?, location newLocation: String?){
        score = newScore
        dateRecorded = newDate
        locationRecorded = newLocation
    }
    
    
    
}
