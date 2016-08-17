//
//  Atividade.swift
//  SECOMP
//
//  Created by FelipeSampaio on 8/16/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class Atividade: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    convenience init() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        let entityDescription = NSEntityDescription.entityForName("Atividade", inManagedObjectContext: context)
        
        self.init(entity: entityDescription!, insertIntoManagedObjectContext: context)
    }

}
