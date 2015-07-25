//
//  PopoverController.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/25/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit


class PopoverController: UIViewController {
  var picker: UIPickerView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let p = picker {
      self.view.addSubview(p)
    }
  }
  
}