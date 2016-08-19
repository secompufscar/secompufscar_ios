//
//  SobresViewController.swift
//  SECOMP
//
//  Created by Student on 8/17/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import UIKit

class SobresViewController: UIViewController {

    
    @IBOutlet weak var aboutSECOMP: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutSECOMP.scrollRangeToVisible(NSMakeRange(0, 0))
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
