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
  }
  
  func webViewDidFinishLoad(webView: UIWebView) {
    NetworkStack.kill()

  }
  
  @IBAction func closeMe(sender: AnyObject) {
    NetworkStack.kill()
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
