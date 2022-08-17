//
//  AddContactMH1.swift
//  Contacts
//
//  Created by Vuong The Vu on 09/08/2022.
//

import UIKit



class AddContactMH1: UIViewController  {
    @IBAction func btnHuy(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    weak var dele: UpdateContactAfterProtocol? = nil
    @IBAction func btnXong(_ sender: Any) {
        if  (txtID.text != "" || imgHinh.image != UIImage(named: "") || txtTen.text != "" || txtSDT.text != "" || txtEmail.text != "" || txtCongTy.text != "" || txtNgaySinh.text != "") {
            let item = Person(id: txtID.text ?? "", images: "" , name: txtTen.text ?? ""  ,phonenumber:  txtSDT.text ?? "" ,email: "\( txtEmail.text ?? "")" ,company: "\( txtCongTy.text ?? "")" ,dateofbirth: "\(txtNgaySinh.text ?? "")" )
            
            dele?.classListUpdate(with: item)
            self.dismiss(animated: true)
        }
    }
    
    var detailPerson: [Person] = [
        Person(id: "20", images: "", name: "LinhPhilip", phonenumber: "910JQK", email: "LinhphiLip@thungphaSanh-vn.com", company: "FB88_Nhà cái hàng đầu Châu Âu", dateofbirth: "10/10/2022")
    ]
    
    
    @IBOutlet weak var imgHinh: UIImageView!
    
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtTen: UITextField!
    @IBOutlet weak var txtSDT: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtCongTy: UITextField!
    @IBOutlet weak var txtNgaySinh: UITextField!
        
                 
        override func viewDidLoad() {
        super.viewDidLoad()
        title = "Thêm Liên Hệ"
        }
}

