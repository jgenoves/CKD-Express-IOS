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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        patientData = self.delegate.activePatientUser
        self.userField.text = patientData?.firstName
        self.scoreField.text = "\(patientData!.getMostRecentScore()!.score)"
        self.stageField.text = patientData?.ckdStage
        self.baseField.text = "\(patientData!.baseGFRScore)"
        
    }

}

