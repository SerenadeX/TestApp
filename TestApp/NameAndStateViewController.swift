//
//  NameAndStateViewController.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/23/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit


class NameAndStateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var startSearchButton: UIButton!
  @IBOutlet weak var selectStateButton: UIButton!
  @IBOutlet weak var searchField: UITextField!
  @IBOutlet weak var segmentedSelector: UISegmentedControl!
  

  
  
  @IBAction func switchStuff(sender: AnyObject) {
    if segmentedSelector.selectedSegmentIndex == 0 {
      //Name
      selectStateButton.hidden = true
      startSearchButton.hidden = false
      searchField.hidden = false
    } else {
      selectStateButton.hidden = false
      startSearchButton.hidden = true
      searchField.hidden = true
    }
    
    
    
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCellWithIdentifier("repCell") as! UITableViewCell
  }
  
}
