//
//  PatientScoreDetailViewController.swift
//  CKD Express
//
//  Created by Jordan Genovese on 4/24/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import Foundation
import UIKit


class PatientScoreDetailViewController : UIViewController {
    
    var patientScore: GFRScore!
    var triggerRed: Bool!
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let dateString = patientScore.dateRecorded.dateValue().toString(dateFormat: "MM/dd/yyyy")
        dateLabel.text = dateString
        
        let scoreString = String(format:"%.01f", patientScore.score)
        scoreLabel.text = scoreString
        if(self.triggerRed){
            scoreLabel.textColor = UIColor.systemRed
        }
        
        
        locationLabel.text = patientScore.locationRecorded
        
        
    }
    
    
}
