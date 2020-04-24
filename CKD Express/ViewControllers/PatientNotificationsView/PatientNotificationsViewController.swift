//
//  PatientNotificationsViewController.swift
//  CKD Express
//
//  Created by Jordan Genovese on 4/14/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//
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

    @IBOutlet var headerLabel: UILabel!
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
            headerLabel.text = "2 New Notifications"
            LabelA.text = "    Schedule a Checkup to get a new GFR Score"
            LabelA.textColor = UIColor.red
            LabelA.backgroundColor = UIColor.red.withAlphaComponent(0.2)
            LabelA.layer.cornerRadius = 10.0
            LabelA.clipsToBounds = true
            
            
            labelB.text = "    Schedule a Nephrology Appointment"
            labelB.textColor = UIColor.orange
            labelB.backgroundColor = UIColor.orange.withAlphaComponent(0.2)
            labelB.layer.cornerRadius = 10.0
            labelB.clipsToBounds = true
            
        }
        else if patientData?.needCheckup() == true && patientData?.needNephVisit() == false{
            headerLabel.text = "1 New Notification"
            
            LabelA.text = " Schedule a Checkup to get a new GFR Score"
            LabelA.textColor = UIColor.white
            LabelA.backgroundColor = UIColor.lightGray
            LabelA.layer.borderColor = UIColor.black.cgColor
           
            labelB.text = " Schedule a Nephrology Appointment"
            labelB.textColor = UIColor.white
        }
        else if patientData?.needCheckup() == false && patientData?.needNephVisit() == true{
            headerLabel.text = "1 New Notification"
            LabelA.text = " Schedule a Nephrology Appointment"
            
            LabelA.textColor = UIColor.white
            LabelA.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
            LabelA.layer.cornerRadius = 10.0
            LabelA.clipsToBounds = true
            //LabelA.layer.borderColor = UIColor.red.cgColor
            //LabelA.layer.borderWidth = 2.0
            
            
            labelB.text = " Schedule a Nephrology Appointment"
            labelB.textColor = UIColor.white
            labelB.backgroundColor = UIColor.white
        }
        
        else {
            headerLabel.text = "No New Notifications"
            
            LabelA.text = " No Notifications"
            LabelA.textColor = UIColor.white
            LabelA.backgroundColor = UIColor.white
            
            labelB.text = " Schedule a Nephrology Appointment"
            labelB.textColor = UIColor.white
            labelB.backgroundColor = UIColor.white
        }
       
    }

    
    
}
