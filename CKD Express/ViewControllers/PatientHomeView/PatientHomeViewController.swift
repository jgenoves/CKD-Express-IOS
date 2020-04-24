//
//  PatientHomeViewController.swift
//  CKD Express
//
//  Created by Jordan Genovese on 3/29/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import UIKit
import Firebase
        
class PatientHomeViewController: UIViewController {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var patientData: Patient?
    
    @IBOutlet var userField: UILabel!
    @IBOutlet var welcomeField: UILabel!
    @IBOutlet var scoreField: UILabel!
    @IBOutlet var stageField: UILabel!
    @IBOutlet var baseField: UILabel!
    @IBOutlet var lastCheckupField: UILabel!
    @IBOutlet var nephVisitWarning: UIImageView!
    @IBOutlet var checkupVisitWarning: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        patientData = self.delegate.activePatientUser
        self.userField.text = "\(patientData!.firstName + " " + patientData!.lastName)"
        self.scoreField.text = "\(patientData!.getMostRecentScore()!.score)"
        self.stageField.text = patientData?.ckdStage
        self.baseField.text = "\(patientData!.baseGFRScore)"
        self.lastCheckupField.text = patientData?.getMostRecentScore()?.dateRecorded.dateValue().toString(dateFormat: "MM/dd/yyyy")
        
        
        if(patientData!.nephVisitNeeded) {
            scoreField.textColor = UIColor.systemRed
            scoreField.backgroundColor = UIColor.systemRed.withAlphaComponent( 0.1 )
            scoreField.layer.cornerRadius = 5
            scoreField.layer.masksToBounds = true
            nephVisitWarning.isHidden = false
        }
        
        patientData!.checkupNeeded = true
        if(patientData!.checkupNeeded) {
            lastCheckupField.textColor = UIColor.systemOrange
            lastCheckupField.backgroundColor = UIColor.systemOrange.withAlphaComponent( 0.1 )
            lastCheckupField.layer.cornerRadius = 5
            lastCheckupField.layer.masksToBounds = true
            checkupVisitWarning.isHidden = false
        }
    }

}

