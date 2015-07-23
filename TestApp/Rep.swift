//
//  Rep.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/23/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit

enum RepType: String {
  case Senator="Senator",Representative="Representative"
}


class Rep {
  var type: RepType?
  var name: String?
  var phone: String?
  var office: String?
  var party: String?
  var state: String?
  var district: String?
  var website: NSURL?
  
  func initWithDict(dict: Dictionary<String, String>) {
    
  }
  

}
