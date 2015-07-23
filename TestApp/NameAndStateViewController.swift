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
  
  var isSenator = false
  var tableData = [Rep]()
  
  
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
  
  

  @IBAction func searchName(sender: AnyObject) {
    let name = searchField.text
    var type: RepType?
    if isSenator {
      type = .Senator
    } else {
      type = .Representative
    }
    
    Requester.getReps(type!, name: name) { (error, reps) -> Void in
      if error == nil {
        self.tableData = reps
        self.tableView.reloadData()
      }
    }
    
  }
  
  var selectedRep: Rep?
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    selectedRep = tableData[indexPath.item]
    performSegueWithIdentifier("detailShowFromNameAndState", sender: self)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let dest = segue.destinationViewController as! RepViewController
    dest.rep = selectedRep
    println(dest.rep!.name!)
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("repCell") as! RepCell
    cell.rep = tableData[indexPath.item]
    cell.mainLabel.text = "\(cell.rep!.name!) – \(cell.rep!.party!)"
    return cell
  }
  
}
