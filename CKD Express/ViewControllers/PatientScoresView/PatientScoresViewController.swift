//
//  PatientScoresViewController.swift
//  CKD Express
//
//  Created by Jordan Genovese on 4/14/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
// Hellooooooooo

import Foundation
import UIKit
import Firebase

extension Date {
       func toString( dateFormat format  : String ) -> String
       {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = format
           return dateFormatter.string(from: self)
       }
   }

class PatientScoresViewController : UITableViewController {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    var patientData: Patient?

    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
        
        patientData = self.delegate.activePatientUser
    }
    
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return (patientData?.gfrScores.count)!
    }
    
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a new or recycled cell
         //let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
        //for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell",for: indexPath) as! ScoreCell
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = patientData?.gfrScores[indexPath.row]
        // Configure the cell with the Item
        cell.scoreLabel.text = "\(item!.score)"
        
        let dateString = item!.dateRecorded.dateValue().toString(dateFormat: "MM.dd.yyyy")
    
        cell.dateLabel.text = dateString
        cell.location.text = "Location:"
        cell.locationLabel.text = "\(item!.locationRecorded)"
        cell.accessoryType = .disclosureIndicator
        
        if (patientData?.nephVisitNeeded == true && item === patientData?.getMostRecentScore()) {
            cell.scoreLabel.textColor = UIColor.red
        }
        
        return cell
    }
    
    
}
