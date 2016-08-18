//
//  InscrevaseViewController.swift
//  SECOMP
//
//  Created by Student on 8/18/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import UIKit

class InscrevaseViewController: UIViewController {

    @IBOutlet weak var AreadoParticipante: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let web = NSURL (string: "https://secompufscar.com.br/2016/areadoparticipante");
        let requestObj = NSURLRequest(URL: web!);
        
        AreadoParticipante.loadRequest(requestObj);

        // Do any additional setup after loading the view.
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
