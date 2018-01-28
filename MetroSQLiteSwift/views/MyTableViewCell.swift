//
//  MyTableViewCell.swift
//  MetroSQLiteSwift
//
//  Created by Jesus on 27/1/18.
//  Copyright © 2018 Jesus. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblLinea: UILabel!
    @IBOutlet weak var lblEstacionIniFin: UILabel!
    @IBOutlet weak var ivLinea: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
