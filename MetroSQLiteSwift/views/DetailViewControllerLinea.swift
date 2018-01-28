//
//  DetailViewControllerLinea.swift
//  MetroSQLiteSwift
//
//  Created by Jesus on 28/1/18.
//  Copyright © 2018 Jesus. All rights reserved.
//

import UIKit

class DetailViewControllerLinea: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewDetail: UITableView!
    @IBOutlet weak var lblIniFinDetail: UILabel!
    @IBOutlet weak var lblLineaDetail: UILabel!
    @IBOutlet weak var lblTopBackground: UILabel!
    
    var linea = Linea()
    var estaciones = [Estacion]()

    override func viewDidLoad() {
        super.viewDidLoad()
        estaciones = DaoManager.getInstance().getEstaciones(with: linea.id)
        configureView()
    }
    
    func configureView() {
        lblLineaDetail.text = linea.nombre
        lblIniFinDetail.text = linea.inicioFin
        let color = HexToUIColor.convertColor(hex: linea.color)
        lblTopBackground.backgroundColor = color
        let colorWithAlpha = color.withAlphaComponent(0.8)
        self.view.backgroundColor = colorWithAlpha
        tableViewDetail.backgroundColor = colorWithAlpha
    }
    
    //TABLEVIEW
    func numberOfSections(in tableView: UITableView) -> Int {
        return estaciones.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myDetailCell", for: indexPath) as! MyTableViewCellDetail
        
        let estacion = estaciones[indexPath.section]
        
        cell.lblEstacionDetail.text = estacion.nombre
        cell.backgroundColor = HexToUIColor.convertColor(hex: linea.color)
        cell = createImageViews(cell: cell, estacion: estacion)
        
        return cell
    }
    
    func createImageViews(cell: MyTableViewCellDetail, estacion: Estacion) -> MyTableViewCellDetail {
        removeOldViews(cell: cell)
        for (i, corr) in estacion.correspondencias.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: 150 + (30 * i), y: 40, width: 30, height: 30))
            let image = UIImage(named: "icono_linea_\(corr)")
            imageView.image = image
            imageView.tag = 1
            cell.contentView.addSubview(imageView)
        }
        
        return cell
    }
    
    func removeOldViews(cell: MyTableViewCellDetail) {
        if (cell.contentView.subviews.count > 1) {
            for subview in cell.contentView.subviews {
                if subview.tag == 1 {
                    subview.removeFromSuperview()
                }
            }
        }
    }

}
