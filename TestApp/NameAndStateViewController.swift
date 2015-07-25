//
//  NameAndStateViewController.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/23/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit


class NameAndStateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIPopoverControllerDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var startSearchButton: UIButton!
  @IBOutlet weak var selectStateButton: UIButton!
  @IBOutlet weak var searchField: UITextField!
  @IBOutlet weak var segmentedSelector: UISegmentedControl!
  
  var isSenator = false
  var tableData = [Rep]()
  var picker: UIPickerView?
  var popover: UIPopoverController?
  
  var selectedStateValue = ""
  
  
  
  
  
  
  override func viewDidLoad() {
    var pickerWidth: CGFloat?
    var pickerY: CGFloat?
    
    if isIpad {
      pickerWidth = 400
      pickerY = 0
    } else {
      pickerWidth = UIScreen.mainScreen().bounds.width
      pickerY = UIScreen.mainScreen().bounds.height
    }
    
    picker = UIPickerView(frame: CGRect(x: 0, y: pickerY!, width: pickerWidth!, height: 270))
    picker?.backgroundColor = UIColor.whiteColor()
    picker!.delegate = self
    picker!.dataSource = self
    
    if !isIpad {
      view.addSubview(picker!)
    } else {
      let p = PopoverController()
      p.picker = picker
      popover = UIPopoverController(contentViewController: p)
      popover!.setPopoverContentSize(picker!.bounds.size, animated: true)
      popover?.delegate = self

//      popover!.view = UIView(frame: CGRect(x: 0, y: 0, width: pickerWidth!, height: picker!.bounds.height))
      
      //      let rect = CGRect(origin: selectStateButton.bounds.origin, size: CGSize(width: picker!.bounds.width, height: picker!.bounds.height))
      //      popover?.view.bou

    }
  }
  
  func setupPopover() {
    
    
//    popover!.popoverPresentationController!.sourceView = selectStateButton
//    popover!.popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: picker!.bounds.width, height: picker!.bounds.height)
//    popover!.view.bounds.origin.y += 30
//    popover!.view.bounds.size.width = picker!.bounds.width
//    popover!.view.bounds.size.height = picker!.bounds.height
  }
  
  
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
  
  
  @IBAction func selectState(sender: UIButton!) {
    
    if selectStateButton.currentTitle != "Done" && !isIpad {
      selectStateButton.setTitle("Done", forState: .Normal)
      UIView.beginAnimations("picker", context: nil)
      UIView.setAnimationDuration(0.5)
      picker?.transform = CGAffineTransformMakeTranslation(0, -236)
      UIView.commitAnimations()
    } else if isIpad {
      setupPopover()
      popover?.presentPopoverFromRect(sender.bounds, inView: sender, permittedArrowDirections: UIPopoverArrowDirection.Up, animated: true)
//      presentViewController(popover!, animated: true, completion: nil)
    } else {
      dismissState(selectStateButton)
    }
    
  }
  
  func popoverControllerDidDismissPopover(popoverController: UIPopoverController) {
    selectStateButton.setTitle(selectedStateValue, forState: .Normal)
    searchState()
  }
  
  
  func dismissState(sender: UIButton!) {
    selectStateButton.setTitle(selectedStateValue, forState: .Normal)
    UIView.beginAnimations("picker", context: nil)
    UIView.setAnimationDuration(0.5)
    picker?.transform = CGAffineTransformMakeTranslation(0, 236)
    UIView.commitAnimations()
    searchState()
    
    
  }
  
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return stateStrings.count
  }
  
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    return stateStrings[row]
  }
  
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    selectedStateValue = stateStrings[row]
    println(selectedStateValue)
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
  
  func searchState() {
    var type: RepType?
    if isSenator {
      type = .Senator
    } else {
      type = .Representative
    }
    
    Requester.getReps(type!, state: selectedStateValue) { (error, reps) -> Void in
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
