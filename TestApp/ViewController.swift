//
//  ViewController.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/22/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    func destIsSenator(valid: Bool) {
      let d = segue.destinationViewController as! NameAndStateViewController
      d.isSenator = valid
    }
    
    
    switch segue.identifier! {
    case "repShow":
      destIsSenator(false)
    case "senShow":
      destIsSenator(true)
    default:
      break
    }
  }
  
}

