//
//  AppDelegate.swift
//  FruitsDiet
//
//  Created by Ravi Shankar on 29/07/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit
import KontaktSDK
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var beaconManager: KTKBeaconManager!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert, categories: nil))
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = false
        IQKeyboardManager.sharedManager().shouldResignOnTouchOutside = true
        // Override point for customization after application launch.
        // Set API Key
        Kontakt.setAPIKey("aRoeUpfkNosHVdIJOZiMcozMZJGAGpDc")
        
        // Initiate Beacon Manager
        beaconManager = KTKBeaconManager(delegate: self)
        beaconManager.requestLocationAlwaysAuthorization()
        
        // Region
        let aquariumUUID = NSUUID(UUIDString: "f7826da6-4fa2-4e98-8024-bc5b71e0893e")
        let aquariumRegion = KTKBeaconRegion(proximityUUID: aquariumUUID!, identifier: "Beacon")
        
        // Start Monitoring and Ranging
        beaconManager.startMonitoringForRegion(aquariumRegion)
        beaconManager.startRangingBeaconsInRegion(aquariumRegion)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate: KTKBeaconManagerDelegate {
    
    func beaconManager(manager: KTKBeaconManager, didChangeLocationAuthorizationStatus status: CLAuthorizationStatus) {
        
    }
    
    func beaconManager(manager: KTKBeaconManager, didEnterRegion region: KTKBeaconRegion) {
        print("Enter region \(region)")
        
        Notifications.display("Witaj w domu:\n-Nakarm kota\n-Nakarm rybki")
        
        let importAlert: UIAlertController = UIAlertController(title: "Witaj w domu!", message:"nakarm kota", preferredStyle: UIAlertControllerStyle.Alert)
        importAlert.addAction(UIAlertAction(title: "Nie", style: .Destructive, handler: nil))
        
        importAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler:{(alert: UIAlertAction!) in
            print("papa")
//            let listVC = ViewController()
//            listVC.category = 1
//            UIApplication.topViewController()?.presentViewController(listVC, animated: true, completion: nil)
//                   }))
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            nextViewController.category = 0
        UIApplication.topViewController()!.navigationController?.pushViewController(nextViewController, animated: true)
    }))
    
        self.window?.rootViewController?.presentViewController(importAlert, animated: true, completion: nil)
    }
    
    func beaconManager(manager: KTKBeaconManager, didExitRegion region: KTKBeaconRegion) {
        print("Exit region \(region)")
        
        Notifications.display("Zanim wyjdziesz z domu:\n-Wyłącz żelazko\n-Nakarm kota")
        
        
        let importAlert: UIAlertController = UIAlertController(title: "Zanim wyjdziesz z domu", message:" Wyłącz żelazko \n Nakarm kota", preferredStyle: UIAlertControllerStyle.Alert)
        importAlert.addAction(UIAlertAction(title: "Nie chce", style: .Destructive, handler: nil))
        
        importAlert.addAction(UIAlertAction(title: "Ok, pokaż listę", style: .Default, handler:{(alert: UIAlertAction!) in
            print("papa")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            nextViewController.category = 0
            UIApplication.topViewController()!.navigationController?.pushViewController(nextViewController, animated: true)
        }))
        
        self.window?.rootViewController?.presentViewController(importAlert, animated: true, completion: nil)
    }
    
    func beaconManager(manager: KTKBeaconManager, didRangeBeacons beacons: [CLBeacon], inRegion region: KTKBeaconRegion) {
        print("Ranged beacons count: \(beacons.count)")
    }
}
