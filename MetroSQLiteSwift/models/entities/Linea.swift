//
//  Linea.swift
//  MetroSQLiteSwift
//
//  Created by Jesus on 27/1/18.
//  Copyright © 2018 Jesus. All rights reserved.
//

import UIKit

class Linea: NSObject {
    var id:Int32 = Int32()
    var nombre: String = String()
    var color: String = String()
    var inicioFin: String = String()
    func toString() -> String {
        return "id:\(id), nombre:\(nombre), color: \(color), inifin: \(inicioFin)"
    }
}
