//
//  AppDelegate.swift
//  ProximityReminders
//
//  Created by Christopher Bonuel on 12/20/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        guard let window = window else { return false }
        
        let masterViewController = TaskListController(managedObjectContext: CoreDataController().managedObjectContext)
        let masterNavigationControler = UINavigationController(rootViewController: masterViewController)
        
        let splitVC = UISplitViewController()
        splitVC.viewControllers = [masterNavigationControler]
        
        window.rootViewController = splitVC
        window.makeKeyAndVisible()
        
        return true
    }
}

