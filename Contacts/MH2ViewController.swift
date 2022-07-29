//
//  MH2ViewController.swift
//  Contacts
//
//  Created by Vuong The Vu on 28/07/2022.
//

import UIKit

class MH2ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBAction func btnBackMH1(_ sender: Any) {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH1Main") as! ViewController
        navigationController?.pushViewController(scr, animated: true)
    }
    
    var arr = ["linh", "long","lan"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MH2TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MH2TableViewCell
        cell.lbHT.text = arr[indexPath.row]
        cell.btnCTiet.tag = indexPath.row
        //cell.btnCTiet.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        return cell
    }

    func btnAction() {
       // let indexPath = IndexPath(row: sender.tag, section: 0)
        
       // let cell = arr[indexPath.row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
