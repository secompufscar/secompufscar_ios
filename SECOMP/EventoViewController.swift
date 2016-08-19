//
//  EventoViewController.swift
//  SECOMP
//
//  Created by FelipeSampaio on 8/15/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import UIKit

class EventoViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var nomePalestrante: UILabel!
    
    @IBOutlet weak var labelHora: UILabel!
    
    @IBOutlet weak var textDescricao: UITextView!
    
    var viasegue: Atividade = Atividade ()
    
    @IBOutlet weak var imagePalestrante: UIImageView!
    
    @IBOutlet weak var botaoMarcarFavorito: UIBarButtonItem!
    
    @IBAction func marcarFavorito(sender: UIBarButtonItem) {
        viasegue.favorito = viasegue.favorito == true ? false: true
        AtividadeDAO.salvar()
        AtividadeDAO.atualizarDados()
        sender.image = UIImage(named: "Star Filled-50")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(AtividadeDAO.buscarTodos().count)
        // Do any additional setup after loading the view.
        
        if viasegue.favorito == false {
            botaoMarcarFavorito.image = UIImage(named: "Star-50")
        } else {
            botaoMarcarFavorito.image = UIImage(named: "Star Filled-50")
        }
                
        label.text = viasegue.nome
        
        nomePalestrante.text = viasegue.ministrante
        
        labelHora.text = viasegue.local! + ", " + viasegue.data! + " - " + viasegue.hora_inicio!
        
        textDescricao.text = viasegue.descricao
        textDescricao.scrollRangeToVisible(NSMakeRange(0, 0))
    
        imagePalestrante.image = UIImage(data: viasegue.foto!)
        imagePalestrante.layer.borderWidth = 1.75
        imagePalestrante.layer.borderColor = UIColor(colorLiteralRed: 0.9607843, green: 0.9607843, blue: 0.9607843, alpha: 1).CGColor
        imagePalestrante.layer.cornerRadius = 10
        imagePalestrante.clipsToBounds = true
    }
    
    override func viewWillAppear(animated: Bool) {
        //prepara o que vai aparecer
    }
    
    override func viewDidAppear(animated: Bool) {
        //depois que apareceu, o que acontece
        textDescricao.scrollRangeToVisible(NSMakeRange(0, 0))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
