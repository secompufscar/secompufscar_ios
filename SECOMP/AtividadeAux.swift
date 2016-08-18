//
//  AtividadeAux.swift
//  SECOMP
//
//  Created by Marcelo de Oliveira da Silva on 8/17/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import Foundation

class AtividadeAux {
    var nome_atividade: String
    var descricao_atividade: String
    var data_inicio_atividade: String
    var hora_inicio_atividade: String
    var hora_fim_atividade: String
    var hora_retorno_atividade: String?
    var hora_fim_retorno_atividade: String?
    var local_atividade: String
    var ministrante_atividade: String
    var foto_atividade: String
    
    init(
        nome_atividade: String,
        descricao_atividade: String,
        data_inicio_atividade: String,
        hora_inicio_atividade: String,
        hora_fim_atividade: String,
        hora_retorno_atividade: String?,
        hora_fim_retorno_atividade: String?,
        local_atividade: String,
        ministrante_atividade: String,
        foto_atividade: String) {
        self.nome_atividade = nome_atividade
        self.descricao_atividade = descricao_atividade
        self.data_inicio_atividade = data_inicio_atividade
        self.hora_inicio_atividade = hora_inicio_atividade
        self.hora_fim_atividade = hora_fim_atividade
        self.hora_retorno_atividade = hora_retorno_atividade
        self.hora_fim_retorno_atividade = hora_fim_retorno_atividade
        self.local_atividade = local_atividade
        self.ministrante_atividade = ministrante_atividade
        self.foto_atividade = foto_atividade
    }
}