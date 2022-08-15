//
//  MH2MainVC.swift
//  Contacts
//
//  Created by Vuong The Vu on 01/08/2022.
//

import UIKit

struct MenuItem {
    var name : String
    var phonenumber : String
    var date : String
    var email : String
}
class MH2MainVC: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
        
    @IBOutlet weak var tableView: UITableView!
    
    //chuyển về màn hình 1 Liên hệ
    @IBAction func btnBackMH1Main(_ sender: Any) {
        let scr = storyboard?.instantiateViewController(identifier: "MH1Main") as! ViewController
        navigationController?.pushViewController(scr, animated: true)
    }
    
    
    var searchDS = [MenuItem]()
    var nameDict = [String: [String]]()
    
    let arrayDS = [
        MenuItem(name: "angola", phonenumber: "998877",date: "01-09-2022", email: "abc@gmail.com"),
        MenuItem(name: "viet nam", phonenumber: "222222",date: "02-09-2022", email: "xyz@gmail.com"),
        MenuItem(name: "nga", phonenumber: "333333",date: "03-09-2022", email: "123@gmail.com"),
        MenuItem(name: "cam pu chia", phonenumber: "777777",date: "04-09-2022", email: "987@gmail.com"),
        MenuItem(name: "lao", phonenumber: "999999",date: "05-09-2022", email: "cccc@gmail.com"),
        MenuItem(name: "trung quoc", phonenumber: "000000",date: "03-09-2022", email: "zzzz@gmail.com"),
        MenuItem(name: "nhat ban", phonenumber: "123456",date: "01-09-2022", email: "")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchDS = arrayDS
        
        title = " Gần đây"
        tableView.dataSource = self
        
      //  tableView.delegate = self
    }
    

    func numberOfSections( in tableView: UITableView) -> Int {
        return  1
    }
    
    //hien thi ra so hang tuong ung voi so phan tu cua mang
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchDS.count
    }
    
    //khi click vao cell hiển thị dữ liệu cho từng cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell =  tableView.dequeueReusableCell(withIdentifier: "cell")  /*as! MH2ViewCell*/
        
       if cell == nil {
           cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
      
        let item = searchDS[indexPath.row]
        cell?.textLabel?.text = item.name
        cell?.detailTextLabel?.text = item.phonenumber
        
       // cell.imgView = UIImage(named: "download")//        cell?.detailTextLabel?.text = item.date
//        cell?.detailTextLabel?.text = item.email

        return cell!
    }
    
    //chuyển màn hình bằng code dùng UITableViewDelegate
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let sb = UIStoryboard(name: "MH2Main", bundle: nil)
//        let mh2detail = sb.instantiateViewController(withIdentifier: "MH2Detail") as! ButtonMH2Detail
//        self.navigationController?.pushViewController(mh2detail, animated: true)
//    }
    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MH2ViewCell
//
//        let item = searchDS[indexPath.row]
//        //cell?.myLabel.text = item.name
//        cell.myLabel.text = item.name
//        cell.myButton.tag = indexPath.row
//        cell.myButton.addTarget(self, action: #selector(buttonDetail), for: .touchUpInside)
//    }
//
//    @objc func buttonDetail(sender: UIButton) {
//        let indexpath1  = IndexPath(row:sender.tag, section: 0)
//        lblName  = item.name
//        let home = self.storyboard?.instantiateViewController(withIdentifier: "ButtonMH2Detail") as! ButtonMH2Detail
//    }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let  vc = segue.destination as? ButtonMH2Detail,
           let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            vc.item = searchDS[indexPath.row]
            
            print("chuyen")
        }
    }
}

//chức năng tìm kiếm theo tên
extension MH2MainVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchDS = arrayDS
        } else {
            searchDS = arrayDS.filter({ item
                in
                return item.name.lowercased().contains(searchText.lowercased())
            })            
        }
        tableView.reloadData()
    }
}
