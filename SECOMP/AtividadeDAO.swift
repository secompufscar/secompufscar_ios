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
    
    static func inserir(atividade: Atividade) {
        
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
    
    static func remover(atividade: Atividade) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.deleteObject(atividade)
        
        do {
            try context.save()
            print("Deletou o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func salvar() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        do {
            try context.save()
            print("Alterou o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func atualizar(atividades: [AtividadeAux]) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        let atividadesAtuais = self.buscarTodos()
        
        if atividadesAtuais.count != 0 {
            
            for atividade in atividadesAtuais {
                
                self.remover(atividade)
            }
        }
        
        for novaAtividade in atividades {
            
            let atividade = Atividade()
            
            var image = UIImage()
            
            atividade.nome = novaAtividade.nome_atividade
            atividade.descricao = novaAtividade.descricao_atividade
            atividade.data = novaAtividade.data_inicio_atividade
            atividade.hora_inicio = novaAtividade.hora_inicio_atividade
            atividade.hora_fim = novaAtividade.hora_fim_atividade
            atividade.hora_retorno = novaAtividade.hora_retorno_atividade
            atividade.hora_fim_retorno = novaAtividade.hora_fim_retorno_atividade
            atividade.local = novaAtividade.local_atividade
            atividade.ministrante = novaAtividade.ministrante_atividade
            atividade.tipo = ""
            atividade.favorito = false
            
            let imageData = UIImageJPEGRepresentation(image, 1)
            atividade.foto = imageData
            
        }
        
        
        
        do {
            try context.save()
            print("Atualizou")
            
        } catch let erro as NSError {
            print(erro)
        }
        
    }

    
    static func buscarTodos() -> [Atividade] {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var atividades: [Atividade] = []
        
        let request: NSFetchRequest = NSFetchRequest(entityName: "Atividade")
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
                
        do {
            atividades = try context.executeFetchRequest(request) as! [Atividade]
            print("Total de atividades: ", atividades.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return atividades
    }
    
    static func buscarFavoritos() -> [Atividade] {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var atividades: [Atividade] = []
        
        let request: NSFetchRequest = NSFetchRequest(entityName: "Atividade")
        request.predicate = NSPredicate(format: "favorito == true")
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        
        do {
            atividades = try context.executeFetchRequest(request) as! [Atividade]
            print("Total de Favoritos: ", atividades.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return atividades

    }
    
    
}
