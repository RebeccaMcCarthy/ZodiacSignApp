//
//  TerminologyTableViewController.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 12/03/2022.
//

import Foundation
import UIKit

class TerminologyTableViewController: UITableViewController {
    
    var termData : Terminology!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //termData = Terminology()
        termData = Terminology(xmlFileName: "zodiacTerminology.xml")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return termData.getCount()
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "termcells", for: indexPath)

        // Configure the cell...
        let itemData = termData.getItem(index: indexPath.row)
        
        cell.textLabel?.text = itemData.name
        cell.detailTextLabel?.text = itemData.description

        return cell
    }
    
}
