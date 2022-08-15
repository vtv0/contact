//
//  MH1DetailVC.swift
//  Contacts
//
//  Created by Vuong The Vu on 05/08/2022.
//

import UIKit
class MH1DetailVC: UIViewController {
       
    @IBOutlet weak var imgImage: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblDateOfBirth: UILabel!
    
    
        var item: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        imgImage.image = UIImage(named: item.Images )
        lblName.text = item?.Name
        lblPhoneNumber.text = item?.PhoneNumber
        lblEmail.text = item?.Email
        lblCompany.text = item?.Company
        lblDateOfBirth.text = item?.DateOfBirth
        
    }
    
}
