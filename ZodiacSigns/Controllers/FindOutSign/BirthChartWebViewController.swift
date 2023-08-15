//
//  WebViewController.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 12/03/2022.
//

import Foundation
import UIKit
import WebKit

class BirthChartWebViewController: UIViewController {
    
    
    @IBOutlet weak var WebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebView.load(URLRequest(url: URL(string: "https://astro-charts.com/tools/new/birth-chart/")!))
    }
}
