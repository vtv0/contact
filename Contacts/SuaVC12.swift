//
//  SuaVC12.swift
//  Contacts
//
//  Created by Vuong The Vu on 16/08/2022.
//

import UIKit

class SuaVC12: UIViewController {
    @IBAction func btnHuyMHSua(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    weak var listDelegrate: UpdateContactAfterProtocol? = nil

    weak var detailDelegrate: Update2ContactAfterProtocol? = nil
    
    @IBAction func btnXongMHSua(_ sender: Any) {
        if (txtTenS.text != "" ){
            let item = Person(id: txtID, images: "" , name: txtTenS.text ?? ""  ,phonenumber:  txtSdtS.text ?? "" ,email: "\( txtEmailS.text ?? "")" ,company: "\( txtCongtyS.text ?? "")" ,dateofbirth: "\(txtNgaysinhS.text ?? "")" )
            
            let rs = listDelegrate?.classListUpdate2(with: item)
            if (rs != nil && rs == true) {
                detailDelegrate?.classListUpdate2(with: item)
            }
            self.dismiss(animated: true)
        }
     }
    
    
    var txtID: String = ""
    @IBOutlet weak var txtTenS: UITextField!
    @IBOutlet weak var txtSdtS: UITextField!
    @IBOutlet weak var txtEmailS: UITextField!
    @IBOutlet weak var txtCongtyS: UITextField!
    @IBOutlet weak var txtNgaysinhS: UITextField!
    
    var item: Person!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chi tiết sửa"
        txtID = item!.ID
        txtTenS.text = item?.Name
        txtSdtS.text = item?.PhoneNumber
        txtEmailS.text = item?.Email
        txtCongtyS.text = item?.Company
        txtNgaysinhS.text = item?.DateOfBirth
    }
}


