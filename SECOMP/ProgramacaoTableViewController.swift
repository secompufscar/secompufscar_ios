//
//  ProgramacaoTableViewController.swift
//  SECOMP
//
//  Created by FelipeSampaio on 8/15/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import UIKit
class ProgramacaoTableViewController: UITableViewController {
    
    var atividades = [AtividadeAux]()
    var palestras = [AtividadeAux]()
    var minicursos = [AtividadeAux]()
    
    var imagensPalestras = [UIImage]()
    var imagensMinicursos = [UIImage]()
    var imagensWorkshops = [UIImage]()
    var imagens = [UIImage]()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            atividades = palestras
            imagens = imagensPalestras
//            for _ in self.atividades {
//                self.imagens.append(UIImage())
//            }
            tableView.reloadData()
//            loadDataFromSite("palestras")
        case 1:
            atividades = minicursos
            imagens = imagensMinicursos
//            for _ in self.atividades {
//                self.imagens.append(UIImage())
//            }
            tableView.reloadData()
//            loadDataFromSite("minicursos")
        case 2:
            tableView.reloadData()
//            loadDataFromSite("palestras")
        default:
            break; 
        }
        
    }
    
    func loadDataFromSite() {
        //        let requestURL = NSURL(string: "https://secompufscar.com.br/2016/app/")!
        let requestURL: NSURL = NSURL(string: "http://localhost:8000/2016/app/")!
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
                    
                    print(json)
                    print(json as? [[Dictionary<String, String>]])
                    //                    print(json["atividades"] as? [[[String: String]]])
                    self.palestras = [AtividadeAux]()
                    self.minicursos = [AtividadeAux]()
                    
                    if let palestras = json["palestras"] as? [[String: String]] {
                        //                        print(palestras)
                        
                        for palestra in palestras {
//                            print(palestra)
                            
                            self.palestras.append(
                                AtividadeAux(nome_atividade: palestra["nome_atividade"]!, descricao_atividade: palestra["descricao_atividade"]!, data_inicio_atividade: palestra["data_inicio_atividade"]!, hora_inicio_atividade: palestra["hora_inicio_atividade"]!, hora_fim_atividade: palestra["hora_fim_atividade"]!, hora_retorno_atividade: nil, hora_fim_retorno_atividade: nil, local_atividade: palestra["local_atividade"]!, ministrante_atividade: palestra["ministrante_atividade"]!, foto_atividade: palestra["foto_atividade"]!))
                            
                        }
                        
                        if let minicursos = json["minicursos"] as? [[String: String]] {
                            for minicurso in minicursos {
//                                print(palestra)
                                
                                self.minicursos.append(
                                    AtividadeAux(nome_atividade: minicurso["nome_atividade"]!, descricao_atividade: minicurso["descricao_atividade"]!, data_inicio_atividade: minicurso["data_inicio_atividade"]!, hora_inicio_atividade: minicurso["hora_inicio_atividade"]!, hora_fim_atividade: minicurso["hora_fim_atividade"]!, hora_retorno_atividade: nil, hora_fim_retorno_atividade: nil, local_atividade: minicurso["local_atividade"]!, ministrante_atividade: minicurso["ministrante_atividade"]!, foto_atividade: minicurso["foto_atividade"]!))
                                
                            }
                        }
                        
                        
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            self.tableView.reloadData()
                            
                            for _ in self.palestras {
                                self.imagensPalestras.append(UIImage())
                            }
                            
                            for _ in self.minicursos {
                                self.imagensMinicursos.append(UIImage())
                            }
                        });
                    } else {
                        print("Não consegui fazer o parsing :(")
                    }
                } catch {
                    print("Error with Json: \(error)")
                }
            }
        }
        
        task.resume()
        
    }
    override func viewWillAppear(animated: Bool) {
        self.segmentedControl.selectedSegmentIndex = 0
        
        loadDataFromSite()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.segmentedControl.selectedSegmentIndex = 0
//        
        loadDataFromSite()
//        self.tableView.reloadData()

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
        
        cell.label.text = atividades[indexPath.row].nome_atividade
        cell.horarioLabel.text = atividades[indexPath.row].data_inicio_atividade + " " + atividades[indexPath.row].hora_inicio_atividade
//        cell.imagemMinistrante.image = imagens[indexPath.row]
        
        let url = NSURL(string: atividades[indexPath.row].foto_atividade)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
            dispatch_async(dispatch_get_main_queue(), {
                switch self.segmentedControl.selectedSegmentIndex {
                case 0:
                    self.imagensPalestras[indexPath.row] = UIImage(data: data!)!
                    cell.imagemMinistrante.image = self.imagensPalestras[indexPath.row]
                case 1:
//                    self.segmentedControl.selectedSegmentIndex == 1 {
                    self.imagensMinicursos[indexPath.row] = UIImage(data: data!)!
                    cell.imagemMinistrante.image = self.imagensMinicursos[indexPath.row]
                default: break
                }
//                cell.imagemMinistrante.image = self.imagens[indexPath.row]
//                cell.imagemMinistrante.image = UIImage(data: data!)
                cell.imagemMinistrante.layer.borderWidth = 0.75
                cell.imagemMinistrante.layer.borderColor = UIColor(colorLiteralRed: 0.9607843, green: 0.9607843, blue: 0.9607843, alpha: 1).CGColor
                cell.imagemMinistrante.layer.cornerRadius = 5
                cell.imagemMinistrante.clipsToBounds = true
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
                destination.viasegue = atividades[path!]
                destination.imagem = imagens[path!]
            }
        }
    }
}
