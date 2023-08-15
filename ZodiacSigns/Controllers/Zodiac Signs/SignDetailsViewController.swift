//
//  SignDetailsViewController.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 12/03/2022.
//

import UIKit

class SignDetailsViewController: UIViewController {
    
    //model data
    var signData : Sign!

    //outlets and actions
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateRangeLabel: UILabel!
    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var elementLabel: UILabel!
    @IBOutlet weak var polarityLabel: UILabel!
    @IBOutlet weak var modalityLabel: UILabel!
    @IBOutlet weak var planetLabel: UILabel!

    @IBAction func moreInfoAction(_ sender: Any) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        // data is pushed over the segue
        
        // populate the outlets
        nameLabel.text       = signData.name
        dateRangeLabel.text  = signData.dateRange
        signImageView.image  = UIImage(named: signData.imageMain)
        symbolLabel.text     = signData.symbol
        elementLabel.text    = signData.element
        polarityLabel.text   = signData.polarity
        modalityLabel.text   = signData.modality
        planetLabel.text     = signData.planet
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check segue ID
        if segue.identifier == "segue3"{
            //get the destination controller
            let destinationController = segue.destination as! SignTabBarController
            
            //push the data
            destinationController.signData = self.signData
        
        }
    }
}
