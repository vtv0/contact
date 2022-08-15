//
//  MH21ChiTietVC.swift
//  Contacts
//
//  Created by Vuong The Vu on 28/07/2022.
//

import UIKit

var glb: String? = nil
class MH21ChiTietVC: UIViewController {

    
    @IBOutlet weak var lbTennext: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbTennext.text = glb
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
