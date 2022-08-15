//
//  AddContactMH1.swift
//  Contacts
//
//  Created by Vuong The Vu on 09/08/2022.
//

import UIKit

//class Person {
//    public var Images: String
//    public var Name: String
//    public var PhoneNumber: String
//    public var Email : String
//    public var Company: String
//    public var DateOfBirth: String
//
//
//    init( images: String, name: String, phonenumber: String, email: String, company: String, dateofbirth: String) {
//        self.Images = images
//        self.Name = name
//        self.PhoneNumber = phonenumber
//
//        self.Email = email
//        self.Company = company
//        self.DateOfBirth = dateofbirth
//    }
//}

protocol UpdateContactAfterProtocol: class {
    func classListUpdate( with detailPerson: Person)
}

class AddContactMH1: UIViewController  {
        
//    @IBAction func btnBackLienhe(_ sender: Any) {
//        let scr = storyboard?.instantiateViewController(withIdentifier: "MH1Main") as! ViewController
//        navigationController?.pushViewController(scr, animated: true)
//    }
//    @IBAction func btnHuy(_ sender: Any) {
//    }
    
    weak var dele: UpdateContactAfterProtocol? = nil
    
    @IBAction func btnHuy(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func btnXong(_ sender: Any) {
        if  ( imgHinh.image != UIImage(named: "") || txtTen.text != "" || txtSDT.text != "" || txtEmail.text != "" || txtCongTy.text != "" || txtNgaySinh.text != "") {

            let item = Person(images: "", name: txtTen.text! , phonenumber:  txtSDT.text ?? "", email: "\( txtEmail.text ?? "")", company: "\( txtCongTy.text ?? "")", dateofbirth: "\(txtNgaySinh.text ?? "")" )
            
            dele?.classListUpdate(with: item)
            self.dismiss(animated: true)
        }
    }
    
    var detailPerson: [Person] = [
        Person(images: "", name: "zung", phonenumber: "1515", email: "zung@1515", company: "iiii", dateofbirth: "10/08/2022"),
        Person(images: "", name: "jun", phonenumber: "1616", email: "jun@16", company: "iiii", dateofbirth: "10/08/2022"),
        Person(images: "", name: "anh", phonenumber: "1717", email: "anh@17", company: "iiii", dateofbirth: "10/08/2022"),
        Person(images: "", name: "john", phonenumber: "1818", email: "john@18", company: "iiii", dateofbirth: "10/08/2022")
    ]
    
    @IBOutlet weak var imgHinh: UIImageView!
    
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

