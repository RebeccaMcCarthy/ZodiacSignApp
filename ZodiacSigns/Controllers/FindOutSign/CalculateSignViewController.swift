//
//  CalculateSignViewController.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 12/03/2022.
//

import Foundation
import UIKit

class CalculateSignViewController: UIViewController {
    
    @IBAction func selectedDatePicker(_ sender: UIDatePicker) {
        
        //Set date format to month and day - year not required
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMdd"
        
        //Convert the date recieved from selectedDatePicker and convert it to a string
        let dateString = dateFormatter.string(from: sender.date)
        let dateInt = Int(dateString)
                
        if let dateInt = dateInt {
            let setDOB = dateChecker(withDate: dateInt)
            nameLabel.text = setDOB
        }
    }
    
    // switch function to check between certain date ranges
    private func dateChecker(withDate sign: Int) -> String {
            
            switch sign {
            case 321...419:
                return "Aries"
            case 420...520:
                return "Taurus"
            case 521...621:
                return "Gemini"
            case 622...722:
                return "Cancer"
            case 723...822:
                return "Leo"
            case 823...922:
                return "Virgo"
            case 923...1023:
                return "Libra"
            case 1024...1122:
                return "Scorpion"
            case 1123...1221:
                return "Sagittarius"
            case 120...218:
                return "Aquarius"
            case 219...320:
                return "Pisces"
            default:
                return "Capricorn"
            }
        }
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func birthChartAction(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = ""
    }
}
