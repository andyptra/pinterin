//
//  Page2ViewController.swift
//  Pinterin
//
//  Created by andyptra on 10/28/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import UIKit

class HalamanDuaViewController: UIViewController {
    @IBOutlet weak var label2desc: UILabel!
    var tinggi : CGFloat = 1
    var lebar : CGFloat = 1
    
    @IBOutlet weak var jaraklabel: NSLayoutConstraint!
    
    @IBOutlet weak var tinggigb: NSLayoutConstraint!
    @IBOutlet weak var lebargb: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground()
        
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
        label2desc.font = UIFont.systemFont(ofSize: 17*tinggi)
        jaraklabel.constant = jaraklabel.constant * tinggi
        tinggigb.constant = tinggigb.constant * tinggi
        lebargb.constant = lebargb.constant * tinggi
    }
    
    @IBAction func pindahdbs(_ sender: UIButton) {
//        let defaults = UserDefaults.standard
//        defaults.set(true, forKey: "alreadyclick")
        
        let storyboardDashboard = UIStoryboard.init(name: "Dashboard", bundle: nil)
        
        let  nextViewController = storyboardDashboard.instantiateViewController(withIdentifier: "NavigateDashboard")
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
}
