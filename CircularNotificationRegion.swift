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
    
    // TODO: change to 'class' stored property instead of 'static' when supported
    private static let entityName = "\(CircularNotificationRegion.self)"
    
    var identifier: String {
        return dateCreated.description
    }
    
    var center: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var toCLRegion: CLRegion {
        
        let region = CLCircularRegion(center: center, radius: radius, identifier: identifier)
        
        region.notifyOnEntry = notifyOnEntry
        region.notifyOnExit = notifyOnExit
        
        return region
    }
    
    override func awakeFromInsert() {
        dateCreated = NSDate()
    }
    
    class func circularNotificationRegion(coordinate: CLLocationCoordinate2D, radius: Double = 50.0, notifyOnEntry: Bool, notifyOnExit: Bool, inManagedObjectContext moc: NSManagedObjectContext) -> CircularNotificationRegion {
        
        let circularNotificationRegion = NSEntityDescription.insertNewObjectForEntityForName(CircularNotificationRegion.entityName, inManagedObjectContext: moc) as! CircularNotificationRegion
        
        circularNotificationRegion.latitude = coordinate.latitude
        circularNotificationRegion.longitude = coordinate.longitude
        circularNotificationRegion.radius = radius
        circularNotificationRegion.notifyOnEntry = notifyOnEntry
        circularNotificationRegion.notifyOnExit = notifyOnExit
        
        return circularNotificationRegion
    }
}
