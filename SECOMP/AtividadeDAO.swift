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
    
    static var palestras = [Atividade]()
    static var minicursos = [Atividade]()
    static var workshops = [Atividade]()
    
    static var isUpdated = false
    
    static func inserir(atividade: Atividade) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.insertObject(atividade)
        
        do {
            try context.save()
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
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func salvar() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        do {
            try context.save()
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func atualizarBanco(atividades: [AtividadeAux]) {
        
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
            
            atividade.nome = novaAtividade.nome_atividade
            atividade.descricao = novaAtividade.descricao_atividade
            atividade.data = novaAtividade.data_inicio_atividade
            atividade.hora_inicio = novaAtividade.hora_inicio_atividade
            atividade.hora_fim = novaAtividade.hora_fim_atividade
            atividade.hora_retorno = novaAtividade.hora_retorno_atividade
            atividade.hora_fim_retorno = novaAtividade.hora_fim_retorno_atividade
            atividade.local = novaAtividade.local_atividade
            atividade.ministrante = novaAtividade.ministrante_atividade
            atividade.tipo = novaAtividade.tipo_atividade
            atividade.favorito = false
            
            let imageData = UIImageJPEGRepresentation(novaAtividade.imagem_atividade!, 1)
            atividade.foto = imageData
            
            self.inserir(atividade)
            
            self.isUpdated = false
            
        }        
        
        do {
            try context.save()
            print("Banco Atualizado")
            
        } catch let erro as NSError {
            print(erro)
        }
        
    }
    
    static func atualizarDados() {
        
        if self.isUpdated == false {
            
            let atividades = self.buscarTodos()
            
            self.palestras = []
            self.minicursos = []
            self.workshops = []
            
            for atividade in atividades {
                if atividade.tipo == "palestra" {
                    self.palestras.append(atividade)
                }
                else if atividade.tipo == "minicurso" {
                    self.minicursos.append(atividade)
                }
                else if atividade.tipo == "workshop"{
                    self.workshops.append(atividade)
                }
            }
            self.isUpdated = true
        }
    }

    
    static func buscarTodos() -> [Atividade] {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var atividades: [Atividade] = []
        
        let request: NSFetchRequest = NSFetchRequest(entityName: "Atividade")
        request.sortDescriptors = [NSSortDescriptor(key: "data", ascending: true), NSSortDescriptor(key: "hora_inicio", ascending: true)]
                
        do {
            atividades = try context.executeFetchRequest(request) as! [Atividade]
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
        request.sortDescriptors = [NSSortDescriptor(key: "nome", ascending: true)]
        
        do {
            atividades = try context.executeFetchRequest(request) as! [Atividade]            
        } catch let erro as NSError {
            print(erro)
        }
        
        return atividades

    }   
}
