//
//  MyTableViewCell.swift
//  Contacts
//
//  Created by Vuong The Vu on 04/08/2022.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var mytbcell: UILabel!
    
    @IBOutlet weak var lblname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
