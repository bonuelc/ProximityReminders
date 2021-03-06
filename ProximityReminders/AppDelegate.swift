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
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // register for alerts
        let types: UIUserNotificationType = ([.Alert, .Sound])
        let settings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: nil)
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        guard let window = window else { return false }
        
        let masterViewController = TaskListController(managedObjectContext: CoreDataController().managedObjectContext)
        let masterNavigationControler = UINavigationController(rootViewController: masterViewController)
        
        let detailViewController = AddReminderViewController()
        detailViewController.delegate = masterViewController
        let detailNavigationController = UINavigationController(rootViewController: detailViewController)
        
        let splitVC = UISplitViewController()
        splitVC.delegate = self
        splitVC.viewControllers = [masterNavigationControler, detailNavigationController]
        
        window.rootViewController = splitVC
        window.makeKeyAndVisible()
        
        return true
    }
    
    // MARK: - Split view
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController, ontoPrimaryViewController primaryViewController:UIViewController) -> Bool {
        
        // Return true to indicate that we have handled the collapse by doing nothing; the detailVC will be discarded.
        
        guard let detailNavController = secondaryViewController as? UINavigationController else { return false }
        
        return detailNavController.topViewController is AddReminderViewController
    }
}

