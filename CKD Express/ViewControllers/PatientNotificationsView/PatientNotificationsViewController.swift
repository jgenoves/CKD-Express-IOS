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
            LabelA.text = "Schedule a Checkup to get a new GFR Score"
            LabelA.textColor = UIColor.orange
            LabelA.backgroundColor = UIColor.orange.withAlphaComponent(0.2)
            LabelA.layer.cornerRadius = 10.0
            LabelA.clipsToBounds = true
            
            
            labelB.text = "Schedule an appointment with your Nephrologist"
            labelB.font = UIFont.init(name: "Helvetica", size: 16)!
            labelB.textColor = UIColor.red
            labelB.backgroundColor = UIColor.red.withAlphaComponent(0.2)
            labelB.layer.cornerRadius = 10.0
            labelB.clipsToBounds = true
            
        }
        else if patientData?.needCheckup() == true && patientData?.needNephVisit() == false{
            headerLabel.text = "1 New Notification"
            LabelA.text = "Schedule a Checkup to get a new GFR Score"
            LabelA.textColor = UIColor.orange
            LabelA.backgroundColor = UIColor.orange.withAlphaComponent(0.2)
            LabelA.layer.cornerRadius = 10.0
            LabelA.clipsToBounds = true
           
            labelB.isHidden = true;
        }
        else if patientData?.needCheckup() == false && patientData?.needNephVisit() == true{
            headerLabel.text = "1 New Notification"
            LabelA.text = "Schedule an appointment with your Nephrologist"
            LabelA.font = UIFont.init(name: "Helvetica", size: 16)!
            LabelA.textColor = UIColor.red
            LabelA.backgroundColor = UIColor.red.withAlphaComponent(0.2)
            LabelA.layer.cornerRadius = 10.0
            LabelA.clipsToBounds = true

            labelB.isHidden = true
        }
        
        else {
            headerLabel.text = "No New Notifications"
            
            LabelA.text = "You are healthy and on track with your apointments!"
            LabelA.textColor = UIColor.lightGray
            LabelA.backgroundColor = UIColor.white
            
            labelB.isHidden = true
        }
       
    }

    
    
}
