//
//  ProgramacaoTableViewController.swift
//  SECOMP
//
//  Created by FelipeSampaio on 8/15/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import UIKit

class ProgramacaoTableViewController: UITableViewController {
    
    var vect:[String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        vect = ["Teste1", "Teste2"]
        
        /*let fileURL = NSURL(string: "https://secompufscar.com.br/static/secompufscar2016/sitemapl.txt")
        
        do {
            let dataFromFile = try String(contentsOfURL: fileURL!, encoding: NSUTF8StringEncoding)
            //            let data = NSData(contentsOfURL: fileURL!)
            //            let weatherData = NSData(contentsOfURL: fileURL!, options: nil, error: nil)
            //            label.text = data?.description
            //            print(dataFromFile)
            //label.text = data
        } catch let error as NSError {
            print("Error")
            print(error)
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vect.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellProgIdentifier", forIndexPath: indexPath) as! ProgramacaoTableViewCell
        
        cell.label.text = vect[indexPath.row]
        

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail"{
            if let destination = segue.destinationViewController as? EventoViewController{
                let path = tableView.indexPathForSelectedRow?.row
                destination.viasegue = vect[path!]
            }
        }
    }
}
