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
    var viasegue = ""
    
    
    @IBOutlet weak var imagePalestrante: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = viasegue
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
