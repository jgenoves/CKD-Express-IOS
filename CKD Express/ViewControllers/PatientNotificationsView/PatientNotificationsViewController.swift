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

    @IBOutlet var NephrologistNeeded: UILabel! //first
    @IBOutlet var CheckUpNeeded: UILabel! //second
    
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    var patientData: Patient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        patientData = self.delegate.activePatientUser
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if patientData?.needCheckup() == true && patientData?.needNephVisit() == true{
            NephrologistNeeded.text = "Schedule a Checkup to get a new GFR Score"
            NephrologistNeeded.textColor = UIColor.red
            
            CheckUpNeeded.text = "Schedule a Nephrology Appointment"
            CheckUpNeeded.textColor = UIColor.red
            
        }
        else if patientData?.needCheckup() == true && patientData?.needNephVisit() == false{
           NephrologistNeeded.text = "Schedule a Checkup to get a new GFR Score"
           NephrologistNeeded.textColor = UIColor.red
           
           CheckUpNeeded.text = "Schedule a Nephrology Appointment"
           CheckUpNeeded.textColor = UIColor.white
        }
        else if patientData?.needCheckup() == false && patientData?.needNephVisit() == true{
            NephrologistNeeded.text = "Schedule a Nephrology Appointment"
            NephrologistNeeded.textColor = UIColor.red
            
            CheckUpNeeded.text = "Schedule a Nephrology Appointment"
            CheckUpNeeded.textColor = UIColor.white
        }
        
        else {
            NephrologistNeeded.text = "No Notifications"
            NephrologistNeeded.textColor = UIColor.black
            
            CheckUpNeeded.text = "Schedule a Nephrology Appointment"
            CheckUpNeeded.textColor = UIColor.white
        }
       
    }

    
    
}
