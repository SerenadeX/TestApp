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
  var activityView: UIActivityViewController?
  
  @IBOutlet weak var shareButton: UIButton!
  
  
  @IBOutlet weak var webView: UIWebView!
  override func viewDidLoad() {
    super.viewDidLoad()
    let req = NSMutableURLRequest()
    req.URL = url
    

    
    
    if !iOS7 {
      activityView = UIActivityViewController(activityItems: [url!], applicationActivities: [OpenInSafariActivity()])
      activityView?.popoverPresentationController?.sourceRect = shareButton.bounds
      activityView?.popoverPresentationController?.sourceView = shareButton
    } else {
      shareButton.hidden = true
    }
    
    webView.delegate = self
    webView.loadRequest(req)
    
  }

  
  
  @IBAction func showShareSheet(sender: AnyObject) {
    if !iOS7 {
      activityView?.popoverPresentationController?.sourceRect = shareButton.bounds
      activityView?.popoverPresentationController?.sourceView = shareButton
      
      presentViewController(activityView!, animated: true, completion: nil)
    }
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
