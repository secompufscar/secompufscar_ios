//
//  SobreDevViewController.swift
//  SECOMP
//
//  Created by Student on 8/17/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import UIKit

class SobreDevViewController: UIViewController {

    @IBOutlet weak var fotoAndre: UIImageView!
    @IBOutlet weak var fotoFelipeQuecole: UIImageView!
    @IBOutlet weak var fotoFelipeSampaio: UIImageView!
    @IBOutlet weak var fotoIsadora: UIImageView!
    @IBOutlet weak var fotoMarcelo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrendondarCantosDaImagem(fotoAndre)
        arrendondarCantosDaImagem(fotoFelipeQuecole)
        arrendondarCantosDaImagem(fotoFelipeSampaio)
        arrendondarCantosDaImagem(fotoIsadora)
        arrendondarCantosDaImagem(fotoMarcelo)
    }
    
    func arrendondarCantosDaImagem(fotoDesenvolvedor: UIImageView!) {
        fotoDesenvolvedor.layer.borderWidth = 0.75
        fotoDesenvolvedor.layer.borderColor = UIColor(colorLiteralRed: 0.9607843, green: 0.9607843, blue: 0.9607843, alpha: 1).CGColor
        fotoDesenvolvedor.layer.cornerRadius = 5
        fotoDesenvolvedor.clipsToBounds = true
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
