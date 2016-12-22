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

    override init() {
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
}