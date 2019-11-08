//
//  Page3ViewController.swift
//  Pinterin
//
//  Created by andyptra on 10/24/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import UIKit

class HalamanTigaViewController: UIViewController {
    var tinggi : CGFloat = 1
    var lebar : CGFloat = 1
    
    @IBOutlet weak var labeldesc: UILabel!
    @IBOutlet weak var jaraklabel: NSLayoutConstraint!
    @IBOutlet weak var tinggigb: NSLayoutConstraint!
    @IBOutlet weak var lebargb: NSLayoutConstraint!
    @IBOutlet weak var jarakbtntop: NSLayoutConstraint!
    

    
    
    
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
        jaraklabel.constant = jaraklabel.constant*tinggi
        tinggigb.constant = tinggigb.constant*tinggi
        lebargb.constant = lebargb.constant*tinggi
        
        labeldesc.font = UIFont.systemFont(ofSize: 17*tinggi)
        
        // Do any additional setup after loading the view.
    }

 

    @IBAction func masuk(_ sender: UIButton) {
//       let defaults = UserDefaults.standard
//        defaults.set(true, forKey: "alreadyclick")
//        
     let storyboardDashboard = UIStoryboard.init(name: "Dashboard", bundle: nil)
        
        let  nextViewController = storyboardDashboard.instantiateViewController(withIdentifier: "NavigateDashboard")
        self.present(nextViewController, animated:true, completion:nil)
        
        
    }
    
}
