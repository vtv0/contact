//
//  HM2Controller.swift
//  Contacts
//
//  Created by Vuong The Vu on 19/07/2022.
//

import UIKit

class HM2Controller: UIViewController {

    @IBAction func btnChuyenMH1(_ sender: Any) {
        let scr = storyboard?.instantiateViewController(withIdentifier: "ganday") as! ViewController
        
        present(scr , animated: true,completion: nil)
        navigationController?.pushViewController( scr, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}
