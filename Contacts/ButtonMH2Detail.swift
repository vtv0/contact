//
//  ButtonMH2Detail.swift
//  Contacts
//
//  Created by Vuong The Vu on 01/08/2022.
//

import UIKit

class ButtonMH2Detail: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhonenumber: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblemail: UILabel!
    
    var item: MenuItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
       lblName.text = item.name
      lblPhonenumber.text = item.phonenumber
        lblDate.text = item.date
        lblemail.text = item.email
    }
    

    
}
