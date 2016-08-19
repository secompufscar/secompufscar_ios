//
//  ProgramacaoTableViewController.swift
//  SECOMP
//
//  Created by FelipeSampaio on 8/15/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import UIKit
class ProgramacaoTableViewController: UITableViewController {
    
    var atividades = [Atividade]()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            atividades = AtividadeDAO.palestras
            tableView.reloadData()
        case 1:
           atividades = AtividadeDAO.minicursos
            tableView.reloadData()
        case 2:
            atividades = AtividadeDAO.workshops
            tableView.reloadData()
        default:
            break; 
        }
        
    }
    
    
    @IBAction func refresh(sender: AnyObject) {
        DataFromSite.load()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.segmentedControl.selectedSegmentIndex = 0
        atividades = AtividadeDAO.palestras
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        self.tableView.reloadData()
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
        return atividades.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellProgIdentifier", forIndexPath: indexPath) as! ProgramacaoTableViewCell
        
        cell.label.text = atividades[indexPath.row].nome
        cell.horarioLabel.text = atividades[indexPath.row].data! + ", " + atividades[indexPath.row].hora_inicio!
        cell.imagemMinistrante.image = UIImage(data: atividades[indexPath.row].foto!)
        cell.imagemMinistrante.layer.borderWidth = 0.75
        cell.imagemMinistrante.layer.borderColor = UIColor(colorLiteralRed: 0.9607843, green: 0.9607843, blue: 0.9607843, alpha: 1).CGColor
        cell.imagemMinistrante.layer.cornerRadius = 5
        cell.imagemMinistrante.clipsToBounds = true


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
//        if segue.identifier == "showDetail" {
            if let destination = segue.destinationViewController as? EventoViewController {
                let path = tableView.indexPathForSelectedRow?.row
                destination.viasegue = atividades[path!]
//            }
        }
    }
}
