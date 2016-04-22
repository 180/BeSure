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
        let importAlert: UIAlertController = UIAlertController(title: "Beacons", message: String(format:"%@ in", region.identifier), preferredStyle: UIAlertControllerStyle.Alert)
        importAlert.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler:nil))
        self.window?.rootViewController?.presentViewController(importAlert, animated: true, completion: nil)
    }
    
    func beaconManager(manager: KTKBeaconManager, didExitRegion region: KTKBeaconRegion) {
        print("Exit region \(region)")
        let importAlert: UIAlertController = UIAlertController(title: "Beacons", message: String(format:"%@ out", region.identifier), preferredStyle: UIAlertControllerStyle.Alert)
        importAlert.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler:nil))
        self.window?.rootViewController?.presentViewController(importAlert, animated: true, completion: nil)
    }
    
    func beaconManager(manager: KTKBeaconManager, didRangeBeacons beacons: [CLBeacon], inRegion region: KTKBeaconRegion) {
        print("Ranged beacons count: \(beacons.count)")
    }
}
