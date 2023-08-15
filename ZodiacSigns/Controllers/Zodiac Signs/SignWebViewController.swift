//
//  SignWebViewController.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 12/03/2022.
//

import Foundation
import UIKit
import WebKit

class SignWebViewController: UIViewController {
    
    var signData : Sign!

    //outlets and actions
    @IBOutlet weak var WebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = tabBarController as! SignTabBarController
        WebView.load(URLRequest(url: URL(string: tabBar.signData.webLink)!))
    }
}
