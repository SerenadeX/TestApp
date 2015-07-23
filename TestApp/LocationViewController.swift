//
//  LocationViewController.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/23/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import MobileCoreServices

class LocationViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var locationLabel: UILabel!
  var tableData = [Rep]()
  
  var locationManager: CLLocationManager?
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    locationManager = CLLocationManager()
    let status = CLLocationManager.authorizationStatus()
    locationManager!.delegate = self
    
    if status == .NotDetermined {
      locationManager!.requestWhenInUseAuthorization()
    }
    if status == .Denied || status == .Restricted {
      println("restricted")
      return
    }
    
    
    mapView.showsUserLocation = true
    locationManager!.desiredAccuracy = kCLLocationAccuracyBest
    locationManager!.startUpdatingLocation()
    
  }
  
  
  func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
    println(error)
  }
  
  func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
    dispatch_async(dispatch_get_main_queue(), { () -> Void in
      self.updateLocationString(newLocation)
      
      let userRegion = MKCoordinateRegion(center: newLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
      self.mapView.setRegion(userRegion, animated: true)
      
      
      
      
    })
  }
  
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [AnyObject]) {
    for l in locations {
      let location = l as! CLLocation
      
      dispatch_async(dispatch_get_main_queue(), { () -> Void in
        self.updateLocationString(location)
        
        let userRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.mapView.setRegion(userRegion, animated: true)
        
        
        
        
      })
      
      
      
    }
  }
  
  func updateTableWithZip(zip: String) {
    Requester.getReps(zip, callback: { (error, reps) -> Void in
      self.tableData = reps
      println(reps)
      self.tableView.reloadData()
    })
  }
  
  func updateLocationString(location: CLLocation) {
    let geoCoder = CLGeocoder()
    geoCoder.reverseGeocodeLocation(location) { (placemarks, err) -> Void in
      if let ps = placemarks {
        for p in ps {
          self.updateTableWithZip(p.postalCode)
          self.locationLabel.text = "\(p.locality), \(p.administrativeArea) \(p.postalCode)"
        }
      }
      
    }
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("repCell") as! RepCell
    
    let rep = tableData[indexPath.item]
    cell.rep = rep
    cell.mainLabel.text = "\(rep.name!) (\(rep.party!))"
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData.count
  }
}
