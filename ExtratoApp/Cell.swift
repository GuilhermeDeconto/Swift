//
//  ExtraCells.swift
//  ExtratoApp
//
//  Created by Guilherme Deconto on 4/2/19.
//  Copyright © 2019 Guilherme Deconto. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbCarnet: UILabel!
    @IBOutlet weak var lbInstallment: UILabel!
    @IBOutlet weak var lbTotalValue: UILabel!
    @IBOutlet weak var cvItem: UIView!
    @IBOutlet weak var ivSelect: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
