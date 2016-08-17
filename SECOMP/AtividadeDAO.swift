//
//  AtividadeDAO.swift
//  SECOMP
//
//  Created by FelipeSampaio on 8/16/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AtividadeDAO {
    
    static func insere(atividade: Atividade) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.insertObject(atividade)
        
        do {
            try context.save()
            print("Salvou o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func remove(atividade: Atividade) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        // informar que a operação é um "delete"
        context.deleteObject(atividade)
        
        do {
            try context.save()
            print("Deletou o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func altera() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        do {
            try context.save()
            print("Alterou o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func buscarTodos() -> [Atividade] {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var atividades: [Atividade] = []
        
        let request: NSFetchRequest = NSFetchRequest(entityName: "Atividade")
        request.sortDescriptors = [NSSortDescriptor(key: "horario", ascending: true)]
                
        do {
            atividades = try context.executeFetchRequest(request) as! [Atividade]
            print("Total de atividades: ", atividades.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return atividades
    }
}
