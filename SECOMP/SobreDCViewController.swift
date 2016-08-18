//
//  SobreDCViewController.swift
//  SECOMP
//
//  Created by Student on 8/17/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import UIKit

class SobreDCViewController: UIViewController {

    @IBOutlet weak var AboutDC: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //AboutDC.attributedText = NSAttributedString(
        //AboutDC.text = "O Departamento de Computação existe desde 1972, sendo responsável por habilitar e colocar com excelência anualmente no mercado de trabalho cerca de uma centena de profissionais, que atuam em empresas e em Instituições de Ensino Superior. \n\nAtento à constante evolução na área de computação, o DC-UFSCar tem atuado na vanguarda do desenvolvimento tecnológico, firmando-se no cenário nacional e internacional como um centro de pesquisa bastante atuante.\n\nTexto obtido da página institucional do Departamento de Computação da UFSCar, disponível em www.dc.ufscar.br."
        AboutDC.scrollRangeToVisible(NSMakeRange(0, 0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        AboutDC.scrollRangeToVisible(NSMakeRange(0, 0))
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
