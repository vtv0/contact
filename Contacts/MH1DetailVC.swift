//
//  MH1DetailVC.swift
//  Contacts
//
//  Created by Vuong The Vu on 05/08/2022.
//

import UIKit

protocol Update2ContactAfterProtocol: class {
    func classListUpdate2( with detailPerson: Person)
}

class MH1DetailVC: UIViewController {
    weak var listDelegrate: UpdateContactAfterProtocol? = nil
    
    //dùng segue truyền data giữa các ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController,
           let edit = nav.viewControllers.first as? SuaVC12 {
            edit.item = item
            edit.listDelegrate = listDelegrate
            edit.detailDelegrate = self
        }
    }
    
    @IBOutlet weak var imgImage: UIImageView!
    
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblDateOfBirth: UILabel!
    
    var item: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgImage.image = UIImage(named: item.Images )
        lblID.text = item?.ID
        lblName.text = item?.Name
        lblPhoneNumber.text = item?.PhoneNumber
        lblEmail.text = item?.Email
        lblCompany.text = item?.Company
        lblDateOfBirth.text = item?.DateOfBirth
    }
}

extension MH1DetailVC: Update2ContactAfterProtocol {
    func classListUpdate2(with detailPerson: Person) {
        print("aaaabbbb\(detailPerson.Name)")
        lblName.text = detailPerson.Name
        lblName.reloadInputViews()
        
        lblPhoneNumber.text = detailPerson.PhoneNumber
        lblPhoneNumber.reloadInputViews()
        
        lblEmail.text = detailPerson.PhoneNumber
        lblPhoneNumber.reloadInputViews()
        
        lblEmail.text = detailPerson.Email
        lblEmail.reloadInputViews()
        
        lblCompany.text = detailPerson.Company
        lblCompany.reloadInputViews()
        
        lblDateOfBirth.text = detailPerson.DateOfBirth
        lblDateOfBirth.reloadInputViews()
        
    }
}

