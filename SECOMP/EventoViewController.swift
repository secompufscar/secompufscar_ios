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
    
    
    var viasegue: AtividadeAux = AtividadeAux (nome_atividade: "", descricao_atividade: "", data_inicio_atividade: "", hora_inicio_atividade: "", hora_fim_atividade: "", hora_retorno_atividade: "", hora_fim_retorno_atividade: "", local_atividade: "", ministrante_atividade: "", foto_atividade: "")
    
    
    @IBOutlet weak var imagePalestrante: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = NSURL(string: viasegue.foto_atividade)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
            dispatch_async(dispatch_get_main_queue(), {
                self.imagePalestrante.image = UIImage(data: data!)
            });
        }
        print(viasegue.foto_atividade)
        
        label.text = viasegue.nome_atividade
        
        nomePalestrante.text = viasegue.ministrante_atividade
        
//        let date = viasegue.data_inicio_atividade
//        let calendar = NSCalendar.currentCalendar()
//        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        
//        let year =  components.year
//        let month = components.month
//        let day = components.day
    
        
//        labelHora.text = String(day) + "/" + String(month) + " - " + viasegue.hora_inicio_atividade
        labelHora.text = viasegue.data_inicio_atividade + " - " + viasegue.hora_inicio_atividade
        
        textDescricao.text = viasegue.descricao_atividade
    
        
        imagePalestrante.layer.borderWidth = 1.75
        imagePalestrante.layer.borderColor = UIColor(colorLiteralRed: 0.9607843, green: 0.9607843, blue: 0.9607843, alpha: 1).CGColor
        imagePalestrante.layer.cornerRadius = 10
        imagePalestrante.clipsToBounds = true
//        imagePalestrante.image = UIImage(data: NSData(contentsOfURL: NSURL(fileURLWithPath: viasegue.foto_atividade))!)
    
        
    }
    
    override func viewWillAppear(animated: Bool) {
        //prepara o que vai aparecer
    }
    
    override func viewDidAppear(animated: Bool) {
        //depois que apareceu, o que acontece
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
