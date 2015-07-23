//
//  RepViewController.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/23/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit


class RepViewController: UIViewController {
  var rep: Rep?
  
  @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var officeLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!


  
  override func viewDidLoad() {
    super.viewDidLoad()

    if let r = rep {
      districtLabel.text = r.district!
      nameLabel.text = r.name!
      partyLabel.text = r.party!
      phoneLabel.text = r.phone!
      officeLabel.text = r.office!
      stateLabel.text = r.state!
    }
    
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let s = segue.destinationViewController as! BrowserViewController
    
    s.url = rep!.website
  }
}
