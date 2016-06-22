//
//  ViewController.swift
//  Project4
//
//  Created by Sachin Lamba on 21/06/16.
//  Copyright © 2016 LambaG. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "https://apple.com")!
        webView.loadRequest(NSURLRequest(URL: url))
        webView.allowsBackForwardNavigationGestures = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "open", style: .Plain, target: self,
                                                            action: #selector(openTapped))
        
    }
    
    func openTapped() {
        let ac = UIAlertController(title: "open page", message: nil, preferredStyle: .ActionSheet)
        ac.addAction(UIAlertAction(title: "bing.com", style: .Default, handler: openPage))
        ac.addAction(UIAlertAction(title: "google.com", style: .Default, handler: openPage))
        ac.addAction(UIAlertAction(title: "cancel", style: .Cancel, handler: nil))
        presentViewController(ac, animated: true, completion: nil)
        
    }
    
    func openPage(action: UIAlertAction!) {
        let url = NSURL(string: "https://" + action.title!)!
        webView.loadRequest(NSURLRequest(URL: url))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

