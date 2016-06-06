//
//  detalleLibro.swift
//  buscadorLibrosTablas
//
//  Created by Administrador on 22/05/16.
//  Copyright © 2016 ITESO. All rights reserved.
//

import UIKit

class detalleLibro: UIViewController {

    
    let lib = Libros.sharedInstance
    var titulo = ""
    var autor = ""
    var port : String? = nil
    
    
    @IBOutlet weak var tituloLibro: UILabel!
    @IBOutlet weak var autorLibro: UILabel!
    @IBOutlet weak var portada: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tituloLibro.text = self.lib.libros[self.lib.id][0]
        self.autorLibro.text = self.lib.libros[self.lib.id][1]
        
                    print(self.lib.libros[self.lib.id][0]!)
                    print(self.lib.libros[self.lib.id][1]!)
        
        if self.lib.libros[self.lib.id][2] != nil && self.lib.libros[self.lib.id][2] != "nil" {
//            self.port = self.lib.libros[self.lib.id][2]!
            print(self.lib.libros[self.lib.id][2]!)
            let imagen = NSURL(string: self.lib.libros[self.lib.id][2]!)
            
            if imagen != nil {
                let datos = NSData(contentsOfURL: imagen!)
                
                self.portada.image = UIImage(data: datos!)
                
            }
        }
        
        //        self.portada.image = UIImage(data: NSData(contentsOfURL: NSURL(string: self.lib.libros[self.lib.id][2]!)!)!)
        
        
        
    }
    
}
