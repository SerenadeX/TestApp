//
//  BrowserViewController.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/23/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit


class BrowserViewController: UIViewController, UIWebViewDelegate {
  var url: NSURL?

  
  var finished = false
  
  
  @IBOutlet weak var webView: UIWebView!
  override func viewDidLoad() {
    super.viewDidLoad()
    let req = NSMutableURLRequest()
    req.URL = url
    
    webView.delegate = self
    webView.loadRequest(req)
    
  }
  
  func webViewDidStartLoad(webView: UIWebView) {
    NetworkStack.increment()
    finished = false
  }
  
  func webViewDidFinishLoad(webView: UIWebView) {
    NetworkStack.decrement()
    finished = true
  }
  
  @IBAction func closeMe(sender: AnyObject) {
    if !finished {
      NetworkStack.decrement()
    }
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
