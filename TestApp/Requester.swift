//
//  Requester.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/23/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit

enum StateEnum: String {
  case AK = "AK", AL = "AL", AR = "AR", AZ = "AZ", CA = "CA", CO = "CO", CT = "CT", DC = "DC", DE = "DE", FL = "FL", GA = "GA", HI = "HI", IA = "IA", ID = "ID", IL = "IL", IN = "IN", KS = "KS", KY = "KY", LA = "LA", MA = "MA", MD = "MD", ME = "ME", MI = "MI", MN = "MN", MO = "MO", MS = "MS", MT = "MT", NC = "NC", ND = "ND", NE = "NE", NH = "NH", NJ = "NJ", NM = "NM", NV = "NV", NY = "NY", OH = "OH", OK = "OK", OR = "OR", PA = "PA", RI = "RI", SC = "SC", SD = "SD", TN = "TN", TX = "TX", UT = "UT", VA = "VA", VT = "VT", WA = "WA", WI = "WI", WV = "WV", WY = "WY"
}


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
          
          
          
          
          println("\(key) \(value)")
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
        println(data)
        println(parsed)
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
    
    
    
    let url = NSURL(string: "\(host)/getall_\(typeString)_byname.php?name=\(name)&output=json")!
    println(url.description)
    Requester.sendRequest(url, callback: callback)
    
    
  }
  
  static func getReps(type: RepType, state: StateEnum, callback: ((error: NSError!, reps: [Rep]) -> Void)) {
    var typeString = ""
    if type == .Senator {
      typeString = "sens"
    } else {
      typeString = "reps"
    }
    
    
    
    let url = NSURL(string: "\(host)/getall_\(typeString)_bystate.php?name=\(state.rawValue)&output=json")!
    Requester.sendRequest(url, callback: callback)
  }
  
  static func getReps(zipcode: String, callback: ((error: NSError!, reps: [Rep]) -> Void)) {
    let url = NSURL(string: "\(host)/getall_mems.php?zip=\(zipcode)&output=json")!
    Requester.sendRequest(url, callback: callback)
  }
}
