//
//  iOSVersions.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/24/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit
let iOS7 = floor(NSFoundationVersionNumber) <= floor(NSFoundationVersionNumber_iOS_7_1)
let iOS8 = floor(NSFoundationVersionNumber) > floor(NSFoundationVersionNumber_iOS_7_1)

let isIpad = UIDevice.currentDevice().model.hasPrefix("iPad")