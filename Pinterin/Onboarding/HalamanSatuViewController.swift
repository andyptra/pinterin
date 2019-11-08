//
//  Page1ViewController.swift
//  Pinterin
//
//  Created by andyptra on 10/28/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import UIKit

class HalamanSatuViewController: UIViewController {
    
    @IBOutlet weak var labeldesc: UILabel!
    var tinggi : CGFloat = 1
    var lebar : CGFloat = 1
    @IBOutlet weak var tinggigb: NSLayoutConstraint!
    
    @IBOutlet weak var lebarbg: NSLayoutConstraint!
    
    @IBOutlet weak var jarakatas: NSLayoutConstraint!
    
    @IBOutlet weak var jaraklabel: NSLayoutConstraint!
    
    override func viewDidLoad() {
        view.addBackground()
        super.viewDidLoad()
        if  UIScreen.main.bounds.height < 667 {
            tinggi = UIScreen.main.bounds.height/667
        }
        else if UIScreen.main.bounds.width < 375 {
            lebar = UIScreen.main.bounds.width
        }
        else if UIScreen.main.bounds.width > 375 {
            lebar = UIScreen.main.bounds.width
        }
        else if UIScreen.main.bounds.height  > 667 {
            tinggi = UIScreen.main.bounds.height/667
        }
        jarakatas.constant = jarakatas.constant*tinggi
        tinggigb.constant = tinggigb.constant*tinggi
        lebarbg.constant = tinggigb.constant
        jaraklabel.constant = jaraklabel.constant*tinggi
        labeldesc.font = UIFont.systemFont(ofSize: 17*tinggi)
        
    }
    @IBAction func pindahD(_ sender: UIButton) {
//        let defaults = UserDefaults.standard
//        defaults.set(true, forKey: "alreadyclick")
        let storyboardDashboard = UIStoryboard.init(name: "Dashboard", bundle: nil)
        let  nextViewController = storyboardDashboard.instantiateViewController(withIdentifier: "NavigateDashboard")
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
}
