//
//  Atividade+CoreDataProperties.swift
//  SECOMP
//
//  Created by Student on 8/17/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Atividade {

    @NSManaged var descricao: String?
    @NSManaged var horario: NSDate?
    @NSManaged var imagem: NSData?
    @NSManaged var local: String?
    @NSManaged var ministrante: String?
    @NSManaged var nome: String?

}
