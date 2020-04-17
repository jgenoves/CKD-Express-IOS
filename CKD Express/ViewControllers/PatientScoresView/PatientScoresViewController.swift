//
//  PatientScoresViewController.swift
//  CKD Express
//
//  Created by Jordan Genovese on 4/14/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
// Hellooooooooo

import Foundation
import UIKit

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
         let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
        for: indexPath)
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = patientData?.gfrScores[indexPath.row]
        cell.textLabel?.text? = "\(item!.score)"
        cell.detailTextLabel?.text = item!.locationRecorded
        return cell
    }
    
    
}
