//
//  LocationManager.swift
//  ProximityReminders
//
//  Created by Christopher Bonuel on 12/21/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: CLLocationManager {
    
    // MARK: - Properties
    
    let geocoder = CLGeocoder()
    let presentingViewController: UIViewController
    
    var onLocationFix: ((CLPlacemark?, NSError?) -> Void)? {
        didSet {
            requestLocation()
        }
    }

    init(presentingViewController: UIViewController) {
        
        self.presentingViewController = presentingViewController
        
        super.init()
        
        self.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
        case .NotDetermined:
            requestAlwaysAuthorization()
        case .AuthorizedAlways:
            requestLocation()
        default:
            break
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        if status == .AuthorizedAlways {
            requestLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else { return }
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            
            if let onLocationFix = self.onLocationFix {
                onLocationFix(placemarks?.first, error)
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        notifyUser(ofRegion: region)
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        notifyUser(ofRegion: region)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Location Manager failed with the following error: \(error.localizedDescription)")
    }
    
    func locationManager(manager: CLLocationManager, monitoringDidFailForRegion region: CLRegion?, withError error: NSError) {
        print("Monitoring failed for region with identifier: \(region!.identifier)")
    }
}

// MARK: - Helper Methods

extension LocationManager {
    
    func notifyUser(ofRegion region: CLRegion) {

        if UIApplication.sharedApplication().applicationState == .Active {
            presentingViewController.showAlert(withTitle: nil, andMessage: region.identifier)
        } else {
            let notification = UILocalNotification()
            notification.alertBody = region.identifier
            notification.soundName = UILocalNotificationDefaultSoundName
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
        }
    }
}