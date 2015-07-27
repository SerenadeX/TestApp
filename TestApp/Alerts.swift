//
//  Alerts.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/27/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit


class Alert {
  static func alert(message: String) {
    let a = UIAlertView(title: "Error", message: message, delegate: nil, cancelButtonTitle: "OK")
    a.show()
  }
}
