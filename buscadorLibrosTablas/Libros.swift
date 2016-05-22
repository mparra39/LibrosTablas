//
//  Libros.swift
//  buscadorLibrosTablas
//
//  Created by Administrador on 22/05/16.
//  Copyright © 2016 ITESO. All rights reserved.
//

import Foundation

class Libros {
    
    static let sharedInstance = Libros()
//    var titulo = String()
//    var autores = String()
//    var imagen : String? = nil
    var id = Int()
    
    var libros : Array<Array<String?>> = Array<Array<String?>>()
    
    init(){
        
    }
    
    init(titulo: String, autores: String, imagen: String?){
        
        self.libros.append([titulo, autores, imagen!])
        
    }
    
//    func llenado(){
//        let rest = Libros(titulo: self.titulo, autores: self.autores, imagen: self.imagen)
//        self.libros.append([self.titulo, self.autores, self.autores])
//    }

}