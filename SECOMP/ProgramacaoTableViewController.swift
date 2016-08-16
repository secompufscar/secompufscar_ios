//
//  ProgramacaoTableViewController.swift
//  SECOMP
//
//  Created by FelipeSampaio on 8/15/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import UIKit

class Atividade {
    var nome_atividade: String
    var descricao_atividade: String
    var dia_atividade: String
    var horario_atividade: String
    var local_atividade: String
    var ministrante_atividade: String
    
    init(nome_atividade: String, descricao_atividade: String, dia_atividade: String, horario_atividade: String, local_atividade: String, ministrante_atividade: String) {
        self.nome_atividade = nome_atividade
        self.descricao_atividade = descricao_atividade
        self.dia_atividade = dia_atividade
        self.horario_atividade = horario_atividade
        self.local_atividade = local_atividade
        self.ministrante_atividade = ministrante_atividade
    }
}


//nome_atividade = models.CharField(max_length=255, verbose_name='Nome da atividade')
//#     descricao_atividade = models.TextField(verbose_name='Descrição da atividade')
//#     dia_atividade = models.CharField(max_length=50, choices=DIA_ATIVIDADE, verbose_name='Dia da atividade')
//#     horario_atividade = models.CharField(max_length=50, verbose_name='Horário da atividade')
//#     local_atividade = models.CharField(max_length=255, verbose_name='Local da atividade')
//#     vagas_atividade = models.IntegerField(blank=True, null=True, verbose_name='Número de vagas')
//#     vagas_disponiveis_atividade = models.IntegerField(blank=True, null=True, verbose_name='Vagas disponíveis')
//#     pre_requisitos_atividade = models.CharField(max_length=255, blank=True, verbose_name='Pré-requisitos')
//#     pre_requisitos_recomendados_atividade = models.CharField(max_length=255, blank=True, verbose_name='Pré-requisitos recomendados')
//#     ministrante_atividade = models.ManyToManyField(Ministrante, verbose_name='Ministrante da atividade')
//#     ano_atividade = models.CharField(max_length=4, default=ANO_ATUAL, verbose_name='Ano da atividade')
//#     ordem_atividade = models.IntegerField(verbose_name='Ordem da atividade no site')
//#     esta_ativa_atividade = models.BooleanField(verbose_name='Atividade ativa')

class ProgramacaoTableViewController: UITableViewController {
    
    var vect = [Atividade]()
    
    override func viewWillAppear(animated: Bool) {
        
    }

//    override func viewDidAppear(animated: Bool) {
//        self.tableView.reloadData()
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//        vect = ["Teste1", "Teste2"]
        
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
        
        
        let requestURL: NSURL = NSURL(string: "http://localhost:8000/2016/app/")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do{
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    
                    if let palestras = json["palestras"] as? [[String: String]] {
                        
                        print(palestras)
                        
                        print("\n\n\n\nPalestra1\n")
                        
                        for palestra in palestras {
                            self.vect.append(
                                Atividade(nome_atividade: palestra["nome_atividade"]!, descricao_atividade: palestra["descricao_atividade"]!, dia_atividade: palestra["dia_atividade"]!, horario_atividade: palestra["horario_atividade"]!, local_atividade: palestra["local_atividade"]!, ministrante_atividade: palestra["ministrante_atividade"]!))
                        }
                        
                        //                        print(palestras[0])
                        //
                        //                        self.vect.append(palestras[0]["nome_atividade"]!)
                        dispatch_async(dispatch_get_main_queue(), {
                            self.tableView.reloadData()
                            return
                        })
                        //                        self.tableView.reloadData()
                        //
                        //                        for station in stations {
                        //
                        //                            if let name = station["stationName"] as? String {
                        //                                print
                        ////
                        ////                                if let year = station["buildYear"] as? String {
                        ////                                    print(name,year)
                        ////                                }
                        //
                        //                            }
                        //                        }
                        
                    }
                    
                }catch {
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
        return vect.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellProgIdentifier", forIndexPath: indexPath) as! ProgramacaoTableViewCell
        
        cell.label.text = vect[indexPath.row].nome_atividade
        

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
            if let destination = segue.destinationViewController as? EventoViewController {
                let path = tableView.indexPathForSelectedRow?.row
//                destination.viasegue = vect[path!]
            }
        }
    }
}
