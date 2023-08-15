//
//  AscendentSignViewController.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 12/03/2022.
//

import Foundation
import UIKit

class AscendentSignViewController: UIViewController {
    //model data
    var signData : Sign!
    
    //outlets and actions
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var signTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get data for tab bar controller and populate the outlets
        let tabBar = tabBarController as! SignTabBarController
        nameLabel.text = tabBar.signData.name
        signImageView.image = UIImage(named: tabBar.signData.imageMain)
        signTextView.text = tabBar.signData.ascendingInfo
    }
    
}
