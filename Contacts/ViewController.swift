//
//  ViewController.swift
//  Contacts
//
//  Created by Vuong The Vu on 19/07/2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    

//    @IBAction func btnMhAddContact(_ sender: Any) {
//
//    }
    
    //chuyển màn hình sang MH2
    @IBAction func btnBackMH2(_ sender: Any) {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH2Main") as! MH2MainVC
        navigationController?.pushViewController(scr, animated: true)
    }
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myTable: UITableView!
    var DSTen:[Person] = [
        Person(images: "anh1", name: "nhu", phonenumber: "000", email: "nhu000@.com", company: "aa", dateofbirth:  "08/08/2022"),
        Person(images: "anh2", name: "lan", phonenumber: "111", email: "lan111@.com", company: "bb", dateofbirth: "07/08/2022"),
        Person(images: "", name: "an", phonenumber: "222", email: "ba0@333.com", company: "baba0", dateofbirth: "04/08/2022"),
        Person(images: "", name: "ba", phonenumber: "333", email: "ba1@333.com", company: "baba1", dateofbirth: "24/08/2022"),
        Person(images: "", name: "nang", phonenumber: "444", email: "ba2@333.com", company: "baba2", dateofbirth: "14/08/2022"),
        Person(images: "", name: "bang", phonenumber: "555", email: "ba3@333.com", company: "baba3" , dateofbirth: "04/08/2022"),
        Person(images: "", name: "tu", phonenumber: "666", email: "ba4@333.com", company: "baba4", dateofbirth: "04/08/2022"),
        Person(images: "", name: "tung", phonenumber: "777", email: "ba5@333.com", company: "baba5", dateofbirth: "04/08/2022"),
        Person(images: "", name: "ha", phonenumber: "888", email: "ha@010.com", company: "b1b1", dateofbirth: "01/08/2022"),
        Person(images: "", name: "hang", phonenumber: "999", email: "bon@444.com", company: "bbb", dateofbirth: "04/08/2022"),
        Person(images: "", name: "hung", phonenumber: "1010", email: "nam55@.com", company: "nnn", dateofbirth: "02/08/2022"),
        Person(images: "", name: "linh", phonenumber: "1111", email: "f88@.com", company: "tam", dateofbirth: "05/08/2022"),
        Person(images: "", name: "luan", phonenumber: "1212", email: "luan@999.com", company: "bang", dateofbirth: "06/08/2022"),
        Person(images: "", name: "sau", phonenumber: "1313", email: "sau@666.com", company: "zzz", dateofbirth: "09/08/2022")
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
       print(item,"z")
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

    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {    //bawts su kien chon -> chuyen huong qua man khac va truyen du lieu
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let mh1detail = sb.instantiateViewController(withIdentifier: "MH1Detail") as! MH1DetailVC
//
//        let items = searchDS[sectionTitle[indexPath.section]] ?? []
//        let item = items[indexPath.row]
//        //let arr = searchDS[sectionTitle[indexPath.section]]
//        //let obj = DSTen[indexPath.row]
//
//        //mh1detail.imgImage = DSTen[indexPath.row].Images
//
//        mh1detail.lblName?.text = item.Name
////        mh1detail.lblPhoneNumber = DSTen[indexPath.row].PhoneNumber
//
//       // mh1detail.HTphonenumber = DSTen[indexPath.item].PhoneNumber
//        self.navigationController?.pushViewController(mh1detail, animated: true)
//     }
    
//    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
//
//    }

    //dùng segue truyền data giữa các ViewController
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vc = segue.destination as? MH1DetailVC,
               let cell = sender as? UITableViewCell,
               let indexPath = myTable.indexPath(for: cell) {
                let items = searchDS[sectionTitle[indexPath.section]] ?? []
                vc.item = items[indexPath.row]
                
            }
            
            if let nav = segue.destination as? UINavigationController, let add = nav.viewControllers.first as? AddContactMH1 {
                add.dele = self
            }
            
            
//       if segue.identifier == "firstToSecond" {
//            let toViewController = segue.destination as! AddContactMH1
//            toViewController.dele = self
//        }
       }
    
//      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let mh1detail = sb.instantiateViewController(withIdentifier: "MH1Detail") as! MH1DetailVC
//          self.navigationController?.pushViewController(mh1detail, animated: true)
//
//    }

//ấn giữ cell trong tableView
//    @objc func LongPress(sender: UILongPressGestureRecognizer) {
//        if sender.state == UIGestureRecognizer.State.began {
//            let touchPoint = sender.location(in: myTable)
//
//            if let indexPath = myTable.indexPathForRow(at: touchPoint) {
//            let alert = UIAlertController(title: "Thông báo", message: "Bạn có muốn xóa không?", preferredStyle: .actionSheet)
//                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//                    switch action.style{
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
//    }

//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }

//xóa một hàng trong tableView khi trượt sang phải
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//          if editingStyle == .delete {
//            print("Deleted")
//
//            self.DSten.remove(at: indexPath.row)
//            self.myTable.deleteRows(at: [indexPath], with: .automatic)
//          }
//        }

//    func tableView(_ tableView:UITableView, commit editingStyle:
//    if EditingStyle == .delete {
//        tableView.beginUpdates()
//        DSten.removeRows(at: [indexPath], with: .fade))
//        table.endUpdates()
//    }
//}

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
                        print(_person.Name)
                        print(_person.PhoneNumber)
                        print(searchText)
                        searchDS[keyD]?.append(_person)
                        print(_person.Name.lowercased().contains(searchText.lowercased()))
                        print(_person.PhoneNumber.contains(searchText))
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
        print(searchDS)
        myTable.reloadData()
    }
}

//
//chuc nang tim kiem
//extension ViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText.isEmpty{
//            searchDS = [Person].contains( nam)
//        } else {
//            searchDS = DSTen.filter({item
//                in
//                return item.Name.lowercased().contains(searchText.lowercased())
//            })
//        }
//
//    }
//}

//protocol ModelDelegate: class {
//    func didReceiveData( _data: MenuItem)
//}
extension ViewController: UpdateContactAfterProtocol {
    func classListUpdate(with detailPerson: Person) {
        
        self.DSTen.removeAll()
        self.DSTen.append(detailPerson)
        
        searchDS = [String: [Person]]()
        
        for _person in DSTen {
            let _prefixName = _person.Name.prefix(1).lowercased()
            if (!tenDict.keys.contains(String(_prefixName))) {
                tenDict[String(_prefixName)] = []
            }
            tenDict[String(_prefixName)]?.append(_person)
        }
        searchDS = tenDict
        print(tenDict)
        //xếp tên theo kí tự        //var sectionTitle = [String]()
        sectionTitle = searchDS.keys.sorted()
        sectionTitle.sort()
                
        self.myTable.reloadData()
    }
}




