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
    var port = ""
    
    
    @IBOutlet weak var tituloLibro: UILabel!
    @IBOutlet weak var autorLibro: UILabel!
    @IBOutlet weak var portada: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tituloLibro.text = self.lib.libros[self.lib.id][0]
        self.autorLibro.text = self.lib.libros[self.lib.id][1]
        
        
        
        
    }
    
}
