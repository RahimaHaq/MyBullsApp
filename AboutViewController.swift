//
//  AboutViewController.swift
//  mybullsapp
//
//  Created by iosdeveloper on 13/06/2023.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            let request =  URLRequest(url: url)
            webView.load(request)
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
}
