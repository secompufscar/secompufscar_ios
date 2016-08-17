//
//  ProgramacaoTableViewController.swift
//  SECOMP
//
//  Created by FelipeSampaio on 8/15/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import UIKit

class AtividadeAux {
    var nome_atividade: String
    var descricao_atividade: String
    var data_inicio_atividade: String
    var hora_inicio_atividade: String
    var hora_fim_atividade: String
    var hora_retorno_atividade: String?
    var hora_fim_retorno_atividade: String?
    var local_atividade: String
    var ministrante_atividade: String
    var foto_atividade: String
    
    init(nome_atividade: String, descricao_atividade: String, data_inicio_atividade: String, hora_inicio_atividade: String, hora_fim_atividade: String, hora_retorno_atividade: String?, hora_fim_retorno_atividade: String?, local_atividade: String, ministrante_atividade: String, foto_atividade: String) {
        self.nome_atividade = nome_atividade
        self.descricao_atividade = descricao_atividade
        self.data_inicio_atividade = data_inicio_atividade
        self.hora_inicio_atividade = hora_inicio_atividade
        self.hora_fim_atividade = hora_fim_atividade
        self.hora_retorno_atividade = hora_retorno_atividade
        self.hora_fim_retorno_atividade = hora_fim_retorno_atividade
        self.local_atividade = local_atividade
        self.ministrante_atividade = ministrante_atividade
        self.foto_atividade = foto_atividade
    }
}

class ProgramacaoTableViewController: UITableViewController {
    
    var palestras = [AtividadeAux]()
    var imagens = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        let requestURL = NSURL(string: "https://secompufscar.com.br/2016/app/")!
//        let requestURL: NSURL = NSURL(string: "http://localhost:8000/2016/app/")!
        let urlRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    
                    if let palestras = json["palestras"] as? [[String: String]] {
                        print(palestras)
                    
                        for palestra in palestras {
                          
                            self.palestras.append(
                                AtividadeAux(nome_atividade: palestra["nome_atividade"]!, descricao_atividade: palestra["descricao_atividade"]!, data_inicio_atividade: palestra["data_inicio_atividade"]!, hora_inicio_atividade: palestra["hora_inicio_atividade"]!, hora_fim_atividade: palestra["hora_fim_atividade"]!, hora_retorno_atividade: nil, hora_fim_retorno_atividade: nil, local_atividade: palestra["local_atividade"]!, ministrante_atividade: palestra["ministrante_atividade"]!, foto_atividade: palestra["foto_atividade"]!))

                        }
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            self.tableView.reloadData()
                            
                            for _ in palestras {
                                self.imagens.append(UIImage())
                            }
                        });
                    }
                } catch {
                    print("Error with Json: \(error)")
                }
            }
        }
        
        task.resume()
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
        return palestras.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellProgIdentifier", forIndexPath: indexPath) as! ProgramacaoTableViewCell
        
        cell.label.text = palestras[indexPath.row].nome_atividade
        cell.horarioLabel.text = palestras[indexPath.row].data_inicio_atividade + " " + palestras[indexPath.row].hora_inicio_atividade
//        cell.imagemMinistrante.image = imagens[indexPath.row]
        
        
        
        let url = NSURL(string: palestras[indexPath.row].foto_atividade)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
            dispatch_async(dispatch_get_main_queue(), {
                self.imagens[indexPath.row] = UIImage(data: data!)!
                cell.imagemMinistrante.image = self.imagens[indexPath.row]
                
                
//                cell.imagemMinistrante.image = UIImage(data: data!)
//                cell.imagemMinistrante.layer.borderWidth = 0.75
//                cell.imagemMinistrante.layer.borderColor = UIColor(colorLiteralRed: 0.9607843, green: 0.9607843, blue: 0.9607843, alpha: 1).CGColor
//                cell.imagemMinistrante.layer.cornerRadius = 5
//                cell.imagemMinistrante.clipsToBounds = true
            });
        }

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
        if segue.identifier == "showDetail" {
            if let destination = segue.destinationViewController as? EventoViewController {
                let path = tableView.indexPathForSelectedRow?.row
                destination.viasegue = palestras[path!]
                destination.imagem = imagens[path!]
            }
        }
    }
}
