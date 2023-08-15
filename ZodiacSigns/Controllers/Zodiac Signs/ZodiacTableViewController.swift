//
//  ZodiacTableViewController.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 12/03/2022.
//

import UIKit

class ZodiacTableViewController: UITableViewController {
    
   
    var zodiacData : Zodiac!

    @IBAction func findSignAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //1. load data from model class
        //initialise model data
        //zodiacData = Zodiac() // it was the default init

        //2. load data from xml file
        zodiacData = Zodiac(xmlFileName: "zodiacSigns.xml")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return zodiacData.getCount()
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let signData = zodiacData.getSign(index: indexPath.row)
        
        cell.textLabel?.text = signData.name
        cell.detailTextLabel?.text = signData.dateRange
        cell.imageView?.image = UIImage(named : signData.image)

        return cell
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue4"{
            
            
        }
        else{
            //find indexPath
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        
            // Get the new view controller using segue.destination.
            let destinationController = segue.destination as! SignDetailsViewController
        
            // Pass the selected object to the new view controller.
            destinationController.signData = zodiacData.getSign(index: indexPath!.row)
        }
    }

}
