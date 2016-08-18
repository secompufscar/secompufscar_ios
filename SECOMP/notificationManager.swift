//
//  notificationManager.swift
//  SECOMP
//
//  Created by Student on 8/16/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import Foundation
import UIKit

func sendNotification() {
    
    let localNotification = UILocalNotification()
    
    localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
    localNotification.alertBody = "Teste Notificacao SECOMP"
    localNotification.timeZone = NSTimeZone.defaultTimeZone()
    localNotification.soundName = UILocalNotificationDefaultSoundName
    
    localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
    
    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
}