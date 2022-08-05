//
//  ViewController.swift
//  Contacts
//
//  Created by Vuong The Vu on 19/07/2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource {
    
    @IBAction func btnBackMH2(_ sender: Any) {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH2Main") as! MH2ViewController
        navigationController?.pushViewController(scr, animated: true)
    }
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myTable: UITableView!

    let DSten: [String] =  ["viet nam","trung quoc","han xeng","tay ba nha","bo dao nha","duc","anh","phap","angola","nam phi","ai cap","a rap","jamaica","lao","campuchia","nhat ban","trieu tien"]
    
    var titles: [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
                    
    
    var sectionTitle = [String]()
    var tenDict = [String:[String]]()
    
    //var searchDS = [String:[String]]()
    var isSearching = false
    var searchDS = [String:[String]]()
    
    var textten: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Liên hệ"
        
        searchBar.delegate = self
        myTable.dataSource = self
                
        //xếp tên theo kí tự
        sectionTitle = Array(Set(DSten.compactMap({String($0.prefix(1)) } )))
        sectionTitle.sort()
        
        for stitle in sectionTitle {
            tenDict[stitle] = [String]() //["a" : [],....]
        }
        
        for ten in DSten {   //  print(tenDict [String(ten.prefix(1))])
            tenDict [String(ten.prefix(1))]?.append(ten)   //tên = (value) được thêm vào cùng 1 Key "t"
        }
        
        //gan dict searchDS =  tenDict
        searchDS = tenDict
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//             if isSearching {
//                 return searchDS.count
//             } else {
//                 return DSten.count
//             }
//    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        if isSearching {
//            cell?.textLabel?.text = searchDS[indexPath.row]
//        } else {
//            cell?.textLabel?.text = DSten[indexPath.row]
//        }
//        return cell!
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//            let array = tenDict[sectionTitle[indexPath.section]] ?? []
//            cell?.textLabel?.text = array[indexPath.row]
//            return cell!
//

    //nhóm tên theo a,b,c...hiển thị dl ra tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let array = searchDS[sectionTitle[indexPath.section]] ?? []
        //print(indexPath.section)
        cell?.textLabel?.text = array[indexPath.row]
//        if array.count > indexPath.row {
//            cell?.textLabel?.text = array[indexPath.row] ?? array[indexPath.row]
//        }
        return cell!
    }
    
}


    //dùng segue truyền data giữa các ViewController
//    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? MyViewController,
//           let cell = sender as? UITableViewCell,
//           let tentext = myTable.indexPath(for: cell) {
//            vc.textten = [indexPath.row]
//           }
//    }
   

extension ViewController:  UITableViewDelegate {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchDS[sectionTitle[section]]?.count ?? 0
    }

  
    //  hiển thị ra = số lượng chữ cái trong bảng đếm được
    func numberOfSections(in tableView: UITableView) -> Int {
        return  sectionTitle.count
    }
    
    //nhom ra bảng chữ bên phải MH
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitle
        //return titles
    }
    
    //tao ra cac Section Header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
}


extension ViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchDS  = tenDict
        } else {
//            searchDS = tenDict.compactMap{ pair -> (String, [String])? in
//                guard let s = pair.v
//            }
            searchDS = [String:[String]]()
            for (keyD, valueD) in tenDict {
                if !searchDS.values.contains(valueD) {
                    searchDS[keyD] = [String]()
                }
                for name in valueD {
                    if name.lowercased().contains(searchText.lowercased()) {
                        searchDS[keyD]?.append(name)
                    }
                }
            }
        }

        myTable.reloadData()
    }
}


