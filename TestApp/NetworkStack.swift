//
//  NetworkStack.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/23/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit


class NetworkStack {
  static var stack = 0
  
  static func increment() {
    stack++
    UIApplication.sharedApplication().networkActivityIndicatorVisible = true
  }
  
  static func decrement() {
    stack--
    
    if stack <= 0 {
      stack = 0
      UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
  }
  
  
}