//
//  Atividade+CoreDataProperties.swift
//  SECOMP
//
//  Created by FelipeSampaio on 8/17/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Atividade {

    @NSManaged var descricao: String?
    @NSManaged var foto: NSData?
    @NSManaged var local: String?
    @NSManaged var ministrante: String?
    @NSManaged var nome: String?
    @NSManaged var hora_inicio: String?
    @NSManaged var hora_fim: String?
    @NSManaged var hora_retorno: String?
    @NSManaged var hora_fim_retorno: String?
    @NSManaged var favorito: NSNumber?
    @NSManaged var data: String?
    @NSManaged var tipo: String?

}
