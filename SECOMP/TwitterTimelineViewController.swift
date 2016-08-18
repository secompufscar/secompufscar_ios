//
//  TwitterTimelineViewController.swift
//  SECOMP
//
//  Created by FelipeSampaio on 8/14/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import UIKit
import TwitterKit


class TwitterTimelineViewController: TWTRTimelineViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "#secompufscar", APIClient: client)
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
