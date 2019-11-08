//
//  DasboardTableViewController.swift
//  Pinterin
//
//  Created by andyptra on 10/31/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import UIKit


class DasboardTableViewController: UITableViewController {
    var tinggi : CGFloat = 1
    var angka : Int = 0
    var dashboardPresenter : DashboardPresenter!
    
    override func viewDidLoad() {
        self.tableView.tableFooterView = UIView()
        dashboardPresenter =  DashboardPresenter()
        if  UIScreen.main.bounds.height < 667  {
            tinggi = UIScreen.main.bounds.height/667
        }
       
        else if UIScreen.main.bounds.height  > 667 {
            tinggi = UIScreen.main.bounds.height/667
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func pushNavi(_ id:Int) {
        let page2 = storyboard?.instantiateViewController(withIdentifier: "PetunjukPenggunaan") as! PetunjukPenggunaanViewController
        page2.idKategoriSoal = id
        self.navigationController?.pushViewController(page2, animated: true)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! HeaderTableViewCell
            cell.mainlabel.text = "Kategori SBMPTN"
            return cell
        default:
            if indexPath.row % 2 == 1 {
                let cell = UITableViewCell()
                cell.backgroundColor = UIColor.white
                cell.selectionStyle = .none
                return cell
            }
            let cell = Bundle.main.loadNibNamed("KategoriTableViewCell", owner: self, options: nil)?.first as! KategoriTableViewCell
            cell.UIImageViewDashboard.image = dashboardPresenter.getGambarDashboard(indexGambar: (indexPath.row - 2)/2)
            return cell
        }
      
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.row {
        case 0:
  
            return 49*tinggi
        default:
            if indexPath.row % 2 == 1 {
                return 6*tinggi
            }
           return 190*tinggi
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 && indexPath.row > 1 {
            self.pushNavi(indexPath.row/2)
        }
       
    }
    
}
