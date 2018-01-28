//
//  MainViewControllerLinea.swift
//  MetroSQLiteSwift
//
//  Created by Jesus on 27/1/18.
//  Copyright © 2018 Jesus. All rights reserved.
//

import UIKit

class MainViewControllerLinea: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableViewLineas: UITableView!
    
    var lineas = [Linea]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineas = DaoManager.getInstance().getLineas();
    }

    //TABLEVIEW
    func numberOfSections(in tableView: UITableView) -> Int {
        return lineas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        
        let linea = lineas[indexPath.section]
        
        cell.lblLinea.text = linea.nombre
        cell.lblEstacionIniFin.text = linea.inicioFin
        cell.ivLinea.image = UIImage(named: "icono_linea_\(linea.id)")
        cell.backgroundColor = HexToUIColor.convertColor(hex: linea.color)
        
        return cell
    }

  
    //SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEstaciones" {
            if let indexPath = tableViewLineas.indexPathForSelectedRow {
                let linea = lineas[indexPath.section]
                let controller = segue.destination as! DetailViewControllerLinea
                controller.linea = linea
            }
        }
        
    }

    
    

}
