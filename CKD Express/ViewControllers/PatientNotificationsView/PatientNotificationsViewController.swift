//
//  PatientNotificationsViewController.swift
//  CKD Express
//
//  Created by Jordan Genovese on 4/14/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//
import Foundation
import UIKit

class PatientNotificationsViewController : UIViewController {

    @IBOutlet var LabelA: UILabel!
    @IBOutlet var labelB: UILabel!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    var patientData: Patient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        patientData = self.delegate.activePatientUser
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if patientData?.needCheckup() == true && patientData?.needNephVisit() == true{
            LabelA.text = "Schedule a Checkup to get a new GFR Score"
            LabelA.textColor = UIColor.red
            
            labelB.text = "Schedule a Nephrology Appointment"
            labelB.textColor = UIColor.red
            
        }
        else if patientData?.needCheckup() == true && patientData?.needNephVisit() == false{
           LabelA.text = "Schedule a Checkup to get a new GFR Score"
           LabelA.textColor = UIColor.red
           
           labelB.text = "Schedule a Nephrology Appointment"
           labelB.textColor = UIColor.white
        }
        else if patientData?.needCheckup() == false && patientData?.needNephVisit() == true{
            LabelA.text = "Schedule a Nephrology Appointment"
            LabelA.textColor = UIColor.red
            
            labelB.text = "Schedule a Nephrology Appointment"
            labelB.textColor = UIColor.white
        }
        
        else {
            LabelA.text = "No Notifications"
            LabelA.textColor = UIColor.black
            
            labelB.text = "Schedule a Nephrology Appointment"
            labelB.textColor = UIColor.white
        }
       
    }

    
    
}
