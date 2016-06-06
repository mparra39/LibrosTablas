//
//  TVC.swift
//  buscadorLibrosTablas
//
//  Created by Administrador on 22/05/16.
//  Copyright © 2016 ITESO. All rights reserved.
//

import UIKit
import CoreData

class TVC: UITableViewController {

    let lib = Libros.sharedInstance
    
    @IBOutlet var tableViewLibros: UITableView!
    //coreData
//    let managedContext = appDelegate.managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        
        tableViewLibros.registerClass(UITableViewCell.self,
                                forCellReuseIdentifier: "Cell")
        
        //1
        let appDel : AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let managedContext : NSManagedObjectContext = appDel.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Libro")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let resultado : NSArray = try managedContext.executeFetchRequest(fetchRequest)
            if resultado.count > 0 {
                for res in resultado {
                    print("resultado \(res)")                    //                    self.lib.contexto = (res as? [NSManagedObject])!
//                    self.lib.contexto.append(res as! NSManagedObject)
//                    print(libro.valueForKey("titulo") as? String)
                    self.lib.libros.append([res.valueForKey("titulo") as? String, res.valueForKey("autores") as? String, res.valueForKey("imagen") as? String])
                    print(resultado.count)
                }
                print(self.lib.libros)
                self.tableView!.reloadData()

                //                self.lib.contexto = resultado as! [NSManagedObject]
            }
            
            self.tableView!.reloadData()        //Se actualiza la vista ***
            
            
        }catch {
            
        }
        
        self.tableView!.reloadData()        //Se actualiza la vista ***
        self.title = "Búsqueda"
    }
    
    override func viewWillAppear(animated: Bool) {      //Si regresa del hijo con la modificación de la sangre se actualizará
        super.viewWillAppear(animated)
    
        self.tableView!.reloadData()        //Se actualiza la vista ***
//        print(self.lib.libros)
//        print(self.lib.contexto)
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
        return self.lib.libros.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath)
        
        //Configuracion de celda
//        cell.textLabel?.text = self.lib.libros[indexPath.row][0]
//        print(self.lib.libros[indexPath.row][0])
        print(indexPath.row)
//        let libro = self.lib.libros[indexPath.row][0]
        
        cell.textLabel!.text = self.lib.libros[indexPath.row][0]
        print(self.lib.libros[indexPath.row][0])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
                let ip = self.tableView.indexPathForSelectedRow
                self.lib.id = (ip?.row)!
        
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        
//        
//            let ip = self.tableView.indexPathForSelectedRow
//            self.lib.id = (ip?.row)!
//        
//        
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
