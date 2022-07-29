//
//  MH2TableViewCell.swift
//  Contacts
//
//  Created by Vuong The Vu on 28/07/2022.
//

import UIKit

class MH2TableViewCell: UITableViewCell {
    @IBOutlet weak var lbHT: UILabel!
    
    @IBOutlet weak var btnCTiet: UIButton!
    
    
    //anh xa chuc nang tim kiem
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
