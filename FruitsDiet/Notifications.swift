//
//  Notifications.swift
//  FruitsDiet
//
//  Created by Maciej Stanik on 22/04/16.
//  Copyright © 2016 Maciej Stanik. All rights reserved.
//

import Foundation
import UIKit

class Notifications {
    
    class func display(text: String){
        
        let notification: UILocalNotification = UILocalNotification()
        notification.timeZone = NSTimeZone.defaultTimeZone()
        
        let dateTime = NSDate()
        notification.fireDate = dateTime
        notification.alertBody = text
        notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
}