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
            print("Salvou")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func atualizarBanco(atividades: [AtividadeAux], fotos: [UIImage], tipo: String) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        let atividadesAtuais = self.buscarTodos()
        
        if atividadesAtuais.count != 0 {
            
            for atividade in atividadesAtuais {
                
                self.remover(atividade)
            }
        }
        
        var cont = 0
        
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
            atividade.tipo = tipo
            atividade.favorito = false
            
            let imageData = UIImageJPEGRepresentation(fotos[cont], 1)
            atividade.foto = imageData
            
            cont = cont + 1
            
            self.inserir(atividade)
            
        }        
        
        do {
            try context.save()
            print("Atualizou")
            
        } catch let erro as NSError {
            print(erro)
        }
        
    }
    
    static func atualizarDados() {
        
        let atividades = self.buscarTodos()
        
        self.palestras = []
        self.minicursos = []
        
        for atividade in atividades {
            if atividade.tipo == "palestra" {
                self.palestras.append(atividade)
            }
            else if atividade.tipo == "minicurso" {
                self.minicursos.append(atividade)
            }
        }
        
        print(self.palestras.count)
    }

    
    static func buscarTodos() -> [Atividade] {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var atividades: [Atividade] = []
        
        let request: NSFetchRequest = NSFetchRequest(entityName: "Atividade")
        request.sortDescriptors = [NSSortDescriptor(key: "nome", ascending: true)]
                
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
        request.sortDescriptors = [NSSortDescriptor(key: "nome", ascending: true)]
        
        do {
            atividades = try context.executeFetchRequest(request) as! [Atividade]
            print("Total de Favoritos: ", atividades.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return atividades

    }   
}
