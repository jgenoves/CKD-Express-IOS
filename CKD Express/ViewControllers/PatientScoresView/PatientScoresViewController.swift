//
//  PatientScoresViewController.swift
//  CKD Express
//
//  Created by Jordan Genovese on 4/14/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//  Hannah Meharg

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            switch segue.identifier {
            case "showScoreDetail"?:
                if let row = tableView.indexPathForSelectedRow?.row {
                    
                    let patientScore = patientData?.gfrScores[row]
                    let scoreDetailViewController = segue.destination as! PatientScoreDetailViewController
                    scoreDetailViewController.patientScore = patientScore
                    
                    if(patientData?.nephVisitNeeded == true && patientScore === patientData?.getMostRecentScore()) {
                        scoreDetailViewController.triggerRed = true
                    } else {
                        scoreDetailViewController.triggerRed = false
                    }
                    
                }
        
            default:
                preconditionFailure("Unexpected segue identifier.")
                
            }
            
            
        
        }
        
        @IBAction func addNewItem(_ sender: UIButton) {
    //        // Create a new item and add it to the store
    //        let newItem = prescriptionStore.createPrescription()
    //        // Figure out where that item is in the array
    //        if let index = prescriptionStore.allItems.index(of: newItem) {
    //            let indexPath = IndexPath(row: index, section: 0)
    //                // Insert this new row into the table
    //            tableView.insertRows(at: [indexPath], with: .automatic)
    //
    //        }
            
        }
    
    
}
