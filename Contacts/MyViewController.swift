//
//  MyViewController.swift
//  Contacts
//
//  Created by Vuong The Vu on 26/07/2022.
//

import UIKit

class MyViewController: UIViewController {
    
    var textten: String = ""
    @IBOutlet weak var HTten: UILabel!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HTten?.text = textten
    }
        

}
