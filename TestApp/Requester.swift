//
//  Requester.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/23/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit




let host = "http://whoismyrepresentative.com"
class Requester {

  
  
  static func sendRequest(url: NSURL, callback: ((error: NSError!, reps: [Rep]) -> Void)) {
    
    NetworkStack.increment()
    
    func nsToSwift(ns: NSDictionary) -> Dictionary<String, [Rep]> {
      var dict = Dictionary<String, [Rep]>()
      let arr = ns.valueForKey("results") as! NSArray
      var results = [Rep]()
      for (val) in arr {
        let r = Rep()
        
        for (key, value) in val as! NSDictionary{
          switch key as! String {
          case "name":
            r.name = value as? String
          case "state":
            r.state = value as? String
          case "office":
            r.office = value as? String
          case "phone":
            r.phone = value as? String
          case "party":
            r.party = value as? String
          case "district":
            r.district = value as? String
          case "link":
            r.website = NSURL(string: (value as! String))
          default:
            break
          }
        }
        results.append(r)

      }
      dict["results"] = results
      return dict
    }
    
    
    
    let req = NSURLRequest(URL: url)

    
    
    NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue()) { (res, data, err) -> Void in
      if err != nil {
        NetworkStack.decrement()
        callback(error: err, reps: [Rep]())
        return
      }
      let parsed = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as? NSDictionary
      
      if let p = parsed {
        let swiftly = nsToSwift(p)
        NetworkStack.decrement()
        callback(error: err, reps: swiftly["results"]!)
      } else {
        NetworkStack.decrement()
        callback(error: NSError(), reps: [Rep]())
      }
      
      


    }
    
  }
  

  
  
  static func getReps(type: RepType, name: String, callback: ((error: NSError!, reps: [Rep]) -> Void)) {
    var typeString = ""
    if type == .Senator {
      typeString = "sens"
    } else {
      typeString = "reps"
    }
    
    
    
    let url = NSURL(string: "\(host)/getall_\(typeString)_byname.php?name=\(name)&output=json")
    if let u = url {
      Requester.sendRequest(u, callback: callback)
    } else {
      Alert.alert("Please put in only one name.")
    }
    
    
  }
  
  static func getReps(type: RepType, state: String, callback: ((error: NSError!, reps: [Rep]) -> Void)) {
    var typeString = ""
    if type == .Senator {
      typeString = "sens"
    } else {
      typeString = "reps"
    }
    
    let stEnum = StateEnum.getEnumForString(state)
    
    let url = NSURL(string: "\(host)/getall_\(typeString)_bystate.php?state=\(stEnum.rawValue)&output=json")!
    Requester.sendRequest(url, callback: callback)
  }
  
  static func getReps(zipcode: String, callback: ((error: NSError!, reps: [Rep]) -> Void)) {
    let url = NSURL(string: "\(host)/getall_mems.php?zip=\(zipcode)&output=json")!
    Requester.sendRequest(url, callback: callback)
  }
}
