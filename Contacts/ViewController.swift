//
//  ViewController.swift
//  Contacts
//
//  Created by Vuong The Vu on 19/07/2022.
//

import UIKit

protocol UpdateContactAfterProtocol: class {
    func classListUpdate( with detailPerson: Person)
    func classListUpdate2( with detailPerson: Person) -> Bool
}

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {    
    //chuyển màn hình sang MH2
    @IBAction func btnBackMH2(_ sender: Any) {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH2Main") as! MH2MainVC
        navigationController?.pushViewController(scr, animated: true)
    }
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myTable: UITableView!
    var DSTen:[Person] = [
        Person(id: "1", images: "anh1", name: "nhu", phonenumber: "000", email: "nhu000@.com", company: "aa", dateofbirth:  "08/08/2022"),
        Person(id: "2", images: "anh2", name: "lan", phonenumber: "111", email: "lan111@.com", company: "bb", dateofbirth: "07/08/2022"),
        Person(id: "3", images: "anh3", name: "an", phonenumber: "222", email: "ba0@333.com", company: "baba0", dateofbirth: "04/08/2022"),
        Person(id: "4", images: "anh 4", name: "ba", phonenumber: "333", email: "ba1@333.com", company: "baba1", dateofbirth: "24/08/2022"),
        Person(id: "5", images: "", name: "nang", phonenumber: "444", email: "ba2@333.com", company: "baba2", dateofbirth: "14/08/2022"),
        Person(id: "6", images: "", name: "bang", phonenumber: "555", email: "ba3@333.com", company: "baba3" , dateofbirth: "04/08/2022"),
        Person(id: "7", images: "", name: "tu", phonenumber: "666", email: "ba4@333.com", company: "baba4", dateofbirth: "04/08/2022"),
        Person(id: "8", images: "", name: "tung", phonenumber: "777", email: "ba5@333.com", company: "baba5", dateofbirth: "04/08/2022"),
        Person(id: "9", images: "", name: "ha", phonenumber: "888", email: "ha@010.com", company: "b1b1", dateofbirth: "01/08/2022"),
        Person(id: "10", images: "", name: "hang", phonenumber: "999", email: "bon@444.com", company: "bbb", dateofbirth: "04/08/2022"),
        Person(id: "11", images: "", name: "hung", phonenumber: "1010", email: "nam55@.com", company: "nnn", dateofbirth: "02/08/2022"),
        Person(id: "12", images: "", name: "linh", phonenumber: "1111", email: "f88@.com", company: "tam", dateofbirth: "05/08/2022"),
        Person(id: "13", images: "", name: "luan", phonenumber: "1212", email: "luan@999.com", company: "bang", dateofbirth: "06/08/2022"),
        Person(id: "14", images: "", name: "sau", phonenumber: "1313", email: "sau@666.com", company: "zzz", dateofbirth: "09/08/2022")
    ]
    // var titles: [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    var searchDS = [String: [Person]]()
    
    var sectionTitle = [String]()
    var tenDict = [String: [Person]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Liên hệ"
        searchBar.delegate = self
        myTable.delegate = self
        
        myTable.dataSource = self  // dòng này cấu hình cho myTable để cho 2 hàm cellForRowAt, numberRowInSection
        
        for _person in DSTen {
            let _prefixName = _person.Name.prefix(1).lowercased()
            if (!tenDict.keys.contains(String(_prefixName))) {
                tenDict[String(_prefixName)] = []
            }
            tenDict[String(_prefixName)]?.append(_person)
            
        }
        searchDS = tenDict
        
        //xếp tên theo kí tự        //var sectionTitle = [String]()
        sectionTitle = searchDS.keys.sorted()
        sectionTitle.sort()
        
        
        
        
    }
    
    // hiện thị số hàng trong trong section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchDS[sectionTitle[section]]?.count ?? 0
        //return searchDS.count
    }
    
    //nhóm tên theo a,b,c...hiển thị dl ra tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "CELL") as! DongMH1Cell
        let items = searchDS[sectionTitle[indexPath.section]] ?? []
        let item = items[indexPath.row]
        cell.lblName.text = item.Name
        cell.lblPhoneNumber.text = item.PhoneNumber
        
        //        cell.lblName.text = DSTen[indexPath.row].Name
        //        cell.lblPhoneNumber.text = DSTen[indexPath.row].PhoneNumber
        return cell
    }
    
    //nhom ra bảng chữ bên phải MH
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        //yêu cầu nguồn dữ liệu trả về tiêu để(title) cho các section trong chế độ tableView
        return sectionTitle
    }
    
    //  hiển thị ra = số lượng chữ cái trong bảng đếm được
    func numberOfSections(in tableView: UITableView) -> Int { //khai báo số lượng section
        //yêu cầu nguồn dữ liệu trả về số lượng section trong chế độ tableView
        return  sectionTitle.count
    }
    
    //tao ra cac Section Header là a, b ,c ,...
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    
    @IBAction func btnXong(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "addcontact", sender: self)
    }
    
    //dùng segue truyền data giữa các ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MH1DetailVC,
           let cell = sender as? UITableViewCell,
           let indexPath = myTable.indexPath(for: cell) {
            let items = searchDS[sectionTitle[indexPath.section]] ?? []
            vc.item = items[indexPath.row]
            vc.listDelegrate = self
        }

        if let nav = segue.destination as? UINavigationController, let add = nav.viewControllers.first as? AddContactMH1 {
            add.dele = self
        }
    }
    
    //ấn giữ cell trong tableView
    //    @objc func LongPress(sender: UILongPressGestureRecognizer) {
    //        if sender.state == UIGestureRecognizer.State.began {
    //            let touchPoint = sender.location(in: myTable)
    //
    //            if let indexPath = myTable.indexPathForRow(at: touchPoint) {
    //            let alert = UIAlertController(title: "Thông báo", message: "Bạn có muốn xóa không?", preferredStyle: .actionSheet)
    //                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
    //                    switch action.style {
    //                        case .default:
    //                        print("default")
    //
    //                        case .cancel:
    //                        print("cancel")
    //
    //                        case .destructive:
    //                        print("destructive")
    //
    //                    }
    //                }))
    //                self.present(alert, animated: true, completion: nil)
    //            }
    //        }
    //}
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle:   UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let persons = searchDS[sectionTitle[indexPath.section]] ?? []
            let person:Person = persons[indexPath.row]
            
            DSTen.removeAll(where: {$0.ID == person.ID})
            
            tenDict.removeAll()
            for _person in DSTen {
                let _prefixName = _person.Name.prefix(1).lowercased()
                if (!tenDict.keys.contains(String(_prefixName))) {
                    tenDict[String(_prefixName)] = []
                }
                tenDict[String(_prefixName)]?.append(_person)
                
            }
            
            searchDS = tenDict
            
            myTable.reloadData()
            //                DSTen.remove(at: indexPath.row)
            //                myTable.beginUpdates()
            //                myTable.deleteRows(at: [indexPath], with: .middle)
            //                myTable.endUpdates()
        }
    }
    
}

//chứa năng tìm kiếm
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {  //khi searchBar trống thì searchDS được gán = tenDict
            searchDS  = tenDict
        } else {
            searchDS.removeAll() // xoa hết các phần tử trong dict
            for (keyD, valueD) in tenDict {
                if !searchDS.keys.contains(keyD) { // nếu không tồn tại key trong kiểu Dict
                    //contains: kiểm tra một đối tượng có tồn tại trong một collection - array , set , (dictionary)
                    searchDS[keyD] = [Person]()    // thì gán key trong SearchDS là một mảng Person
                }
                for _person in valueD {
                    if (_person.Name.lowercased().contains(searchText.lowercased())) || (_person.PhoneNumber.contains(searchText)) {
                        searchDS[keyD]?.append(_person)
                    }
                    //                    if tenDict.contains(searchText.lowercased()) {  //không phân biệt chữ hoa hay thường trong SearchBar
                    //                        searchDS[keyD]?.append(_person)
                    //                    }
                }
            }
            searchDS = searchDS.filter({!$0.value.isEmpty}) //lọc các pt value trong searchDS khi giá trị trong Kiểu Dict bị trống
            //$0: là đối số đầu tiên  của value trong Dict
        }
        sectionTitle = Array(Set(searchDS.compactMap({String($0.key.prefix(1)) } ))) //loại bỏ các phần tử các key- a,b, c...khi bị lặp lại trong mảng key của searchDS
        sectionTitle.sort() // sap xep các chỉ mục theo thứ tự a->z
        myTable.reloadData()
    }
}

//extension ViewController: UpdateContactAfterProtocol {
//    func classListUpdate(with detailPerson: Person) {
//        
//        tenDict[String(detailPerson.Name.prefix(1).lowercased())]?.append(detailPerson)
//        searchDS = tenDict
//
//        print(tenDict)
//        //xếp tên theo kí tự        //var sectionTitle = [String]()
//        sectionTitle = searchDS.keys.sorted()
//        sectionTitle.sort()
//                
//        self.myTable.reloadData()
//    }
//}


extension ViewController: UpdateContactAfterProtocol {
    func classListUpdate(with detailPerson: Person) {
        self.DSTen.append(detailPerson)
        
        tenDict = [String: [Person]]()
        searchDS = [String: [Person]]()
        
        for _person in DSTen {
            let _prefixName = _person.Name.prefix(1).lowercased()
            if (!tenDict.keys.contains(String(_prefixName))) {
                tenDict[String(_prefixName)] = []
            }
            tenDict[String(_prefixName)]?.append(_person)
        }
        
        searchDS = tenDict
        //xếp tên theo kí tự        //var sectionTitle = [String]()
        sectionTitle = searchDS.keys.sorted()
        sectionTitle.sort()
        self.myTable.reloadData()
    }
    
    func classListUpdate2(with newPerson: Person) -> Bool {
        for _person in DSTen {
            print("BTN xong \(_person.ID),\(newPerson.ID)")
            if _person.ID == newPerson.ID {
                _person.Name = newPerson.Name
                _person.PhoneNumber = newPerson.PhoneNumber
                _person.Email = newPerson.Email
                _person.DateOfBirth = newPerson.DateOfBirth
                _person.Company = newPerson.Company
            }
        }
        
        tenDict = [String: [Person]]()
        searchDS = [String: [Person]]()
        
        for _person in DSTen {
            let _prefixName = _person.Name.prefix(1).lowercased()
            if (!tenDict.keys.contains(String(_prefixName))) {
                tenDict[String(_prefixName)] = []
            }
            tenDict[String(_prefixName)]?.append(_person)
        }
        
        searchDS = tenDict
        //xếp tên theo kí tự        //var sectionTitle = [String]()
        sectionTitle = searchDS.keys.sorted()
        sectionTitle.sort()
        self.myTable.reloadData()
        return true
    }
    
}




