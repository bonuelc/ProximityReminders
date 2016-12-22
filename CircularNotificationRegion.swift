//
//  CircularNotificationRegion.swift
//  ProximityReminders
//
//  Created by Christopher Bonuel on 12/20/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation

class CircularNotificationRegion: NSManagedObject {
    
    var identifier: String {
        return dateCreated.description
    }
    
    var center: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    override func awakeFromInsert() {
        dateCreated = NSDate()
    }
}
