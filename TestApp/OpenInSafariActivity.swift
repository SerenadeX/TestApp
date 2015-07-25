//
//  OpenInSafariActivity.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/25/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit

class OpenInSafariActivity: UIActivity {
  
  override func activityType() -> String? {
    return "Open In Safari"
  }
  
  override func activityImage() -> UIImage? {
    return UIImage()
  }
  
  override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
    println("ran can")
    return true
  }
  
  override func activityTitle() -> String? {
    return "Open In Safari"
  }
  
  override func prepareWithActivityItems(activityItems: [AnyObject]) {
    UIApplication.sharedApplication().openURL(activityItems[0] as! NSURL)
  }
  
  override static func activityCategory() -> UIActivityCategory{
    return UIActivityCategory.Action
  }
  
}
